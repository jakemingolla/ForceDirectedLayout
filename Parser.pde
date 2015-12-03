import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.HashSet;

/**
 * @author jakemingolla
 * @since 1.2
 *
 * Parser class to handle reading of {@link Atom} and
 * {@link Spring} objects from a CSV file.
 *
 * As of version 1.1, the format for the CSV files is as follows:
 * first line: Atom Number = Integer n representing the number of Atoms.
 * lines 1 through n + 1:
 *      Comma-separated values in the following order:
 *              Identifier (String) *** MUST BE UNIQUE ***
 *              Weight (Double)
 *
 */
public class Parser {

        /**
         * @author jakemingolla
         * @since 1.2
         *
         * Exception to be thrown when there is a duplicate identifier within
         * the Atom declarations in a CSV file.
         */
        public class DuplicateIdentifierException extends Exception {
                public DuplicateIdentifierException() { super(); }
                public DuplicateIdentifierException(String message) { super(message); }
                public DuplicateIdentifierException(String message, Throwable cause) { super(message, cause); }
                public DuplicateIdentifierException(Throwable cause) { super(cause); }
        }

        /**
         * @author jakemingolla
         * @since 1.2
         *
         * Exception to be thrown when there is an invalid Spring delcared within
         * the CSV file. This can occur when one of the following happens:
         *
         *      1. There already exists an edge between the two Nodes
         *         (Note that as of v1.2, edges are only undirected.)
         *
         *      2. The identifier of an Atom within the Spring declaration
         *         does not exist.
         */
        public class IllegalEdgeException extends Exception {
                public IllegalEdgeException() { super(); }
                public IllegalEdgeException(String message) { super(message); }
                public IllegalEdgeException(String message, Throwable cause) { super(message, cause); }
                public IllegalEdgeException(Throwable cause) { super(cause); }
        }
 

        /* Map to store each atom by its unique identifier */
        Map<String, Atom> atomsById;

        /* Set of all identifiers to check for uniqueness */
        Set<String> ids;

        /*
         * Set of all of the neighbor identifiers of a 
         * given identifier.
         */
        Map<String, Set<String>> neighborsById;

        /**
         * @author jakemingolla
         *
         * Default constructor for a Parser object.
         *
         */
        public Parser() {
                atomsById = new HashMap<String, Atom>();
                ids = new HashSet<String>();
                neighborsById = new HashMap<String, Set<String>>();
        }

        /**
         * @author jakemingolla
         *
         * Gets a list of {@link Atom} objects defined at the given CSV file.
         *
         * @param path          Path to the CSV file with the Atoms listed.
         * 
         * @throws DuplicateIdentifierException         If any of the identifiers are not unique.
         */
        public List<Node> getAtoms(String path) throws DuplicateIdentifierException {
                List<Node> atoms = new ArrayList<Node>();

                String[] fileLines = loadStrings(path);
                String[] currLine;

                Integer i = 0;

                /*
                 * NOTE: 
                 * Will throw a NumberFormatException 
                 * if the Atom Number of the CSV is not
                 * an integer.
                 */
                Integer numAtoms = Integer.parseInt(fileLines[i]);

                for (i = 1; i < numAtoms + 1; i++) {
                        currLine = split(fileLines[i], ",");
                        String id = currLine[0];
                        /*
                         * Note:
                         * Will throw a NumberFormatException if
                         * the weight value is not a Double
                         */
                        Double weight = new Double(Double.parseDouble(currLine[1]));

                        /*
                         * Throws a DuplicateIdentifierException if the id has
                         * already been used.
                         */
                        if (ids.contains(id)) {
                                throw new DuplicateIdentifierException("Duplicate = " + id);
                        } else {
                                ids.add(id);
                        }

                        /* Otherwise, add the atom with its respective weight and id to the list. */
                        Atom atom = new Atom(id, weight, getRandomXPosition(), getRandomYPosition(), getRandomXPosition());
                        atoms.add(atom);

                        /* In addition, add a mapping from the identifier to the atom for finding
                         * it in the edge creation. */
                        atomsById.put(id, atom);
                }

                return atoms;
        }

        public List<Edge> getSprings(String path) throws IllegalEdgeException {
                List<Edge> springs = new ArrayList<Edge>();

                String[] fileLines = loadStrings(path);
                String[] currLine;

                /*
                 * NOTE:
                 * Will throw a NumberFormatException
                 * if the Atom Number of the CSV is not
                 * an integer.
                 */
                 Integer numAtoms = Integer.parseInt(fileLines[0]);

                 /* How many lines are used to hold all of the atom information. */
                 Integer atomOffset = numAtoms + 1;

                /*
                 * NOTE:
                 * Will throw a NumberFormatException
                 * if the Spring Number value is not
                 * an integer.
                 */
                 Integer numSprings = Integer.parseInt(fileLines[atomOffset]);

                 /* Offset by two since one is used to declare numSprings. */
                 for (int i = atomOffset + 1; i < atomOffset + numSprings + 1; i++) {
                         currLine = split(fileLines[i], ",");
                         println(i);

                         String id1 = currLine[0];
                         String id2 = currLine[1];

                         /*
                          * If the two identifiers are the same, reject this edge as
                          * no self loops are allowed.
                          */
                         if (id1.equals(id2)) {
                                 throw new IllegalEdgeException("No self-loops allowed.");
                         }

                         /*
                          * NOTE:
                          * Will throw a NumberFormatException if
                          * the ideal length value is not a Double.
                          */
                         Double idealLength = new Double(Double.parseDouble(currLine[2]));

                         /*
                          * If id1 has never been declared as an identifier for an Atom,
                          * the edge is invalid.
                          */
                         Atom a1 = atomsById.get(id1);
                         if (a1 == null) {
                                 throw new IllegalEdgeException("The identifier '" + id1 + "' is invalid.");
                         }

                         /*
                          * If id2 has never been declared as an identifier for an Atom,
                          * the edge is invalid.
                          */
                         Atom a2 = atomsById.get(id2);
                         if (a2 == null) {
                                 throw new IllegalEdgeException("The identifier '" + id2 + "' is invalid.");
                         }

                         /*
                          * Attempt to get the set of neighbors for the first
                          * identifier. If it is a null set, create it.
                          */
                         Set<String> id1Neighbors = neighborsById.get(id1);
                         if (id1Neighbors == null) {
                                 id1Neighbors = new HashSet<String>();
                         }

                         /*
                          * Attempt to get the set of neighbors for the second
                          * identifier. If it is a null set, create it.
                          */
                         Set<String> id2Neighbors = neighborsById.get(id2);
                         if (id2Neighbors == null) {
                                 id2Neighbors = new HashSet<String>();
                         }

                         /*
                         * If there already exists an edge between the Atoms specified by id1 and
                         * id2 the current edge is invalid.
                         */
                         if (id1Neighbors.contains(id2) ||
                             id2Neighbors.contains(id1)) {
                                 throw new IllegalEdgeException("There is already a Spring declared between '" + id1 +
                                                                "' and '" + id2 + "'.");
                         }



                         /*
                          * Now, add in id1 and id2 as neighbors in their respective sets
                          * and update their sets in the master mapping.
                          */
                         id1Neighbors.add(id2);
                         neighborsById.put(id1, id1Neighbors);

                         id2Neighbors.add(id1);
                         neighborsById.put(id2, id2Neighbors);
                        
                         /*
                          * Finally, add the spring to the list of springs with the 
                          * current information.
                          */
                         Spring spring = new Spring(a1, a2, idealLength);
                         springs.add(spring);
                 }

                 return springs;
        }

        /**
         * @author jakemingolla
         *
         * Gets a random x position in relation to the Bounding Box's X and W information
         * stored in the {@link Constants}.
         *
         * @return      The random x position.
         */
        private Double getRandomXPosition() {
                return new Double(random((float)(Constants.DEFAULT_BOUNDING_BOX_X - (Constants.DEFAULT_BOUNDING_BOX_W / 2)),
                                  (float)(Constants.DEFAULT_BOUNDING_BOX_X + (Constants.DEFAULT_BOUNDING_BOX_W / 2))));
        }

        /**
         * @author jakemingolla
         *
         * Gets a random y position in relation to the Bounding Box's Y and H information
         * stored in the {@link Constants}.
         *
         * @return      The random y position.
         */
        private Double getRandomYPosition() {
                return new Double(random((float)(Constants.DEFAULT_BOUNDING_BOX_Y - (Constants.DEFAULT_BOUNDING_BOX_H / 2)),
                                  (float)(Constants.DEFAULT_BOUNDING_BOX_Y + (Constants.DEFAULT_BOUNDING_BOX_H / 2))));
        }

        /**
         * @author jakemingolla
         *
         * Gets a random z position in relation to the Bounding Box's Z and L information
         * stored in the {@link Constants}.
         *
         * @return      The random z position.
         */
        private Double getRandomZPosition() {
                return new Double(random((float)(Constants.DEFAULT_BOUNDING_BOX_Z - (Constants.DEFAULT_BOUNDING_BOX_L / 2)),
                                  (float)(Constants.DEFAULT_BOUNDING_BOX_Z + (Constants.DEFAULT_BOUNDING_BOX_L / 2))));
        }

}
