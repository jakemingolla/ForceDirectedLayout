/**
 * @author jakemingolla
 * @since 1.1
 *
 * Parser class to handle reading of {@link Atom} and
 * {@link Spring} objects from a CSV file.
 */

import java.util.List;
import java.util.ArrayList;

public class Parser {

        public List getAtoms(String path) {
                List<Atom> atoms = new ArrayList<Atom>();

                String[] fileLines = loadStrings(path);
                String[] currLine;

                Integer i = 0;

                /*
                 * NOTE: 
                 * Will throw a NumberFormatException 
                 * if the very first value of the CSV is not
                 * an integer.
                 */
                Integer numNodes = Integer.parseInt(fileLines[i]);
                println("numNodes = " + numNodes);

                for (i = 1; i < numNodes + 1; i++) {
                        currLine = split(fileLines[i], ",");
                        Double weight = new Double(Integer.parseInt(currLine[0]));
                        Atom atom = new Atom(getRandomXPosition(), getRandomYPosition(), getRandomXPosition(), weight);
                        println("creating atoM");
                        atoms.add(atom);
                }

                return atoms;
        }

        private Double getRandomXPosition() {
                return new Double(random((float)(Constants.DEFAULT_BOUNDING_BOX_X - (Constants.DEFAULT_BOUNDING_BOX_W / 2)),
                                  (float)(Constants.DEFAULT_BOUNDING_BOX_X + (Constants.DEFAULT_BOUNDING_BOX_W / 2))));
        }

        private Double getRandomYPosition() {
                return new Double(random((float)(Constants.DEFAULT_BOUNDING_BOX_Y - (Constants.DEFAULT_BOUNDING_BOX_H / 2)),
                                  (float)(Constants.DEFAULT_BOUNDING_BOX_Y + (Constants.DEFAULT_BOUNDING_BOX_H / 2))));
        }

        private Double getRandomZPosition() {
                return new Double(random((float)(Constants.DEFAULT_BOUNDING_BOX_Z - (Constants.DEFAULT_BOUNDING_BOX_L / 2)),
                                  (float)(Constants.DEFAULT_BOUNDING_BOX_Z + (Constants.DEFAULT_BOUNDING_BOX_L / 2))));
        }

}
