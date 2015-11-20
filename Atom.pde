/**
 * @author jakemingolla
 * @since 1.0
 *
 * Point of atomicity within the Force Directed Graph scene.
 * An Atom is the smallest {@link Node} object that is 
 * still {@link Renderable} and can interact with {@link
 * Force} objects.
 *
 * @see Node
 * @see Force
 * @see Renderable
 */
public class Atom extends Node implements Renderable {

        /* Double precision radius of the atom. In relation
         * to the Node object, this corresponds to each of the
         * x, y, and z fields.
         */
        private Double radius;

        Atom(Double x, Double y, Double z) {
            /* TODO     FIX THIS CONSTANT   **/
                super(100.0d,
                      x,
                      y,
                      z,
                      Constants.DEFAULT_ATOM_RADIUS,
                      Constants.DEFAULT_ATOM_RADIUS,
                      Constants.DEFAULT_ATOM_RADIUS,
                      Constants.DEFAULT_ATOM_R,
                      Constants.DEFAULT_ATOM_B,
                      Constants.DEFAULT_ATOM_G,
                      Constants.DEFAULT_ATOM_A);

                radius = Constants.DEFAULT_ATOM_RADIUS;
        }

        public void render() {
                pushMatrix();
                        translate(x.floatValue(), y.floatValue(), z.floatValue());
                        noStroke();
                        fill(r.floatValue(), g.floatValue(), b.floatValue(), a.floatValue());
                        sphere(radius.floatValue());
                popMatrix();
        }
}
