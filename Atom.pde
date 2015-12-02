/**
 * @author jakemingolla
 * @since 1.0
 *
 * Lowest level a {@link Node} can take within a scene. An Atom is
 * a single Node characterized by a sphere rendered with RGBA texture.
 *
 * @see Renderable
 * @see Gravitational
 */
public class Atom extends Node implements Renderable, Gravitational {

        /* Radius of the atom, which overrides its width, height, and length
         * for internal calculations while continuing to meet its Node
         * interface. */
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
