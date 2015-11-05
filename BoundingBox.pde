public class BoundingBox extends Node {

        BoundingBox() {
                super(Constants.DEFAULT_BOUNDING_BOX_X,
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
                pushMatrix();
                        translate(x, y, z);
                        stroke(r, g, b, a);
                        noFill();
                        box(w, h, l);
                popMatrix();
        }

}
