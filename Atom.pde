public class Atom extends Node implements Renderable, Gravitational {

        private Double radius;

        Atom(Double x, Double y, Double z) {
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
