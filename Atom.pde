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
public class Atom extends Node implements Renderable, Gravitational {

        /* Double precision radius of the atom. In relation
         * to the Node object, this corresponds to each of the
         * x, y, and z fields.
         */
        private Double radius;

        /**
         * @author jakemingolla
         *
         * Default constructor for an instance of an Atom object. Defaults
         * can be controlled by the {@link Constants} fields.
         *
         * @param x     The x position of the Atom.
         * @param y     The y position of the Atom.
         * @param z     The z position of the Atom.
         */
        Atom(Double x, Double y, Double z) {
                super(Constants.DEFAULT_ATOM_WEIGHT,
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

        /**
         * @author jakemingolla
         *
         * Overriden render method that renders an Atom into the scene as a sphere
         * with the default RGBA values.
         *
         * @see Renderable
         */
        @Override
        public void render() {
                pushMatrix();
                        translate(x.floatValue(), y.floatValue(), z.floatValue());
                        noStroke();
                        fill(r.floatValue(), g.floatValue(), b.floatValue(), a.floatValue());
                        sphere(radius.floatValue());
                popMatrix();
        }
}
