/**
 * @author jakemingolla
 * @since 1.0
 *
 * Spring class within a Force Directed Graph scene. Implements an
 * {@link Edge} between two {@link Atom} objects.
 *
 * @see Edge
 * @see Atom
 * @see Renderable
 */
public class Spring<Atom> extends Edge implements Renderable {

        /**
         * @author jakemingolla
         *
         * Constructor for a Spring object between two atoms.
         *
         */
        Spring(Atom vertex1, Atom vertex2) {
                super(vertex1, vertex2);
        }

        /**
         * @author jakemingolla
         *
         * Renders an instance of the Spring class. This is defined as a
         * (straight) line between each of the {@link Atom} objects. The 
         * colors can be controlled by the {@link Constants#DEFAULT_SPRING_R},
         * {@link Constants#DEFAULT_SPRING_G}, {@link Constants#DEFAULT_SPRING_B},
         * and {@link Constants#DEFAULT_SPRING_A}, and the stroke weight can be
         * controlled by {@link Constants#DEFAULT_SPRING_STROKE_WEIGHT}.
         */
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
