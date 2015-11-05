public class BoundingBox extends Node implements Renderable {

        BoundingBox() {
                super(Constants.DEFAULT_WEIGHT_SENTINEL,
                      Constants.DEFAULT_BOUNDING_BOX_X,
                      Constants.DEFAULT_BOUNDING_BOX_Y,
                      Constants.DEFAULT_BOUNDING_BOX_Z,
                      Constants.DEFAULT_BOUNDING_BOX_W,
                      Constants.DEFAULT_BOUNDING_BOX_H,
                      Constants.DEFAULT_BOUNDING_BOX_L,
                      Constants.DEFAULT_BOUNDING_BOX_R,
                      Constants.DEFAULT_BOUNDING_BOX_G,
                      Constants.DEFAULT_BOUNDING_BOX_B,
                      Constants.DEFAULT_BOUNDING_BOX_A);
        }

        public void render() {
                println("Rendering bouding box " + x + " " + y + " " + z + " " + w + " " + h + " " + l);
                pushMatrix();
                        translate(x.floatValue(), y.floatValue(), z.floatValue());
                        stroke(r.floatValue(), g.floatValue(), b.floatValue(), a.floatValue());
                        noFill();
                        box(w.floatValue(), h.floatValue(), l.floatValue());
                popMatrix();
        }

}
