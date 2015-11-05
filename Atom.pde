public class Atom extends Node implements Updateable, Renderable {

        private Float radius;

        Atom(Float x, Float y, Float z) {
                super(x,
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
                        translate(x, y, z);
                        noStroke();
                        fill(r, g, b, a);
                        sphere(radius);
                popMatrix();
        }

        public void update() {
        }
}
