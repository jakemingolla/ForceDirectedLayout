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
public class Spring<Atom> extends Edge implements Renderable {

        /**
         * @author jakemingolla
         *
         * Default constructor for the spring class given two {@link Atom}
         * instances.
         *
         * @param vertex1       The first Atom within the Spring.
         * @param vertex2       The second Atom within the Spring.
         */
        Spring(Atom vertex1, Atom vertex2) {
                super(vertex1, vertex2);
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
                       line(vertex1.getX().floatValue(), vertex1.getY().floatValue(), vertex1.getZ().floatValue(),
                            vertex2.getX().floatValue(), vertex2.getY().floatValue(), vertex2.getZ().floatValue());
               popMatrix();
        }
}
