/**
 * @author jakemingolla
 * @since 1,0
 *
 * Scene-specific implementation of a Spring, which will join two
 * {@link Atom} objects inheriting the {@link Node} abstract class.
 *
 * Is the information needed for the implementation of Hooke's 
 * law in a later version.
 *
 * @see Node
 * @see Renderable
 */
public class Spring extends Edge implements Renderable {

        /*
         * Ideal length of the Spring for interaction with
         * Hooke's Law.
         */
        private Double idealLength;

        /**
         * @author jakemingolla
         *
         * Default constructor for the spring class given two {@link Atom}
         * instances.
         *
         * @param vertex1       The first Atom within the Spring.
         * @param vertex2       The second Atom within the Spring.
         */
        Spring(Atom vertex1, Atom vertex2, Double idealLength) {
                super(vertex1, vertex2, Atom.class);
                this.idealLength = idealLength;
        }

        /**
         * @author jakemingolla
         *
         * Overriden render function to render a Spring object. Rendering a Spring
         * is defined as a straight line between each of the {@link Atom} objects
         * as vertices and can be controlled using {@link Constants} fields.
         */
        @Override
        public void render() {
                pushMatrix();
                       stroke(Constants.DEFAULT_SPRING_R.floatValue(),
                              Constants.DEFAULT_SPRING_G.floatValue(),
                              Constants.DEFAULT_SPRING_B.floatValue(),
                              Constants.DEFAULT_SPRING_A.floatValue());
                       strokeWeight(Constants.DEFAULT_SPRING_STROKE_WEIGHT.floatValue()); 
                       /* Note the conversion between our Double values and the float values
                        * needed for processing. */

                        Atom v1 = (Atom)vertex1;
                        Atom v2 = (Atom)vertex2;

                       line(v1.getX().floatValue(), v1.getY().floatValue(), v1.getZ().floatValue(),
                            v2.getX().floatValue(), v2.getY().floatValue(), v2.getZ().floatValue());
               popMatrix();
        }

        /**
         * @author jakemingolla
         *
         * Overriden update function. As of version 1,0, this does nothing as Springs
         * never need to be updated.
         */
        @Override
        public void update() {
        }

        /*
         *
         *      GETTERS AND SETTERS BELOW
         *
         *
         */

        public Double getIdealLength() {
                return idealLength;
        }

        public void setIdealLength(Double idealLength) {
               if (!Utilities.isPositive(idealLength)) {
                       throw new IllegalArgumentException();
               }
               this.idealLength = idealLength;
        }
}
