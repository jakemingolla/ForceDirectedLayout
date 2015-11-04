public class BoundingBox extends Node {

        BoundingBox() {
                super(Constants.BOUNDING_BOX_DEFAULT_X,
                      Constants.BOUNDING_BOX_DEFAULT_Y,
                      Constants.BOUNDING_BOX_DEFAULT_Z,
                      Constants.BOUNDING_BOX_DEFAULT_W,
                      Constants.BOUNDING_BOX_DEFAULT_H,
                      Constants.BOUNDING_BOX_DEFAULT_L,
                      Constants.BOUNDING_BOX_DEFAULT_R,
                      Constants.BOUNDING_BOX_DEFAULT_G,
                      Constants.BOUNDING_BOX_DEFAULT_B,
                      Constants.BOUNDING_BOX_DEFAULT_A);
        }

        public void render() {
              System.out.println("Rendering node at (" + x + ", " + y +
                                   ", " + z + ") with dimensions " + w +
                                   " x " + h + " x " + l + " and color (" +
                                   r + ", " + g + ", " + b + ", " + a +
                                   ").");
 
                pushMatrix();
                        translate(x, y, z);
                        stroke(r, g, b, a);
                        noFill();
                        box(w, h, l);
                popMatrix();
        }

}
