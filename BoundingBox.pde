/**
 * @author jakemingolla
 * @since 1.0
 *
 * Bounding box of a scene that will hold all of the {@link Atom} 
 * objects inside. This object is passive and is not affected by
 * Gravity.
 *
 * @see BoundingForceApplicator
 * @see Renderable
 */
public class BoundingBox extends Node implements Renderable {

        /**
         * @author jakemingolla
         *
         * Default constructor for the Bounding Box object. Can be
         * controlled using the {@link Constants} class to specify
         * all of its {@link Node} constructor information.
         */
        BoundingBox() {
                super(Constants.DEFAULT_BOUNDING_BOX_WEIGHT,
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

        /**
         * @author jakemingolla
         *
         * Overriden render function that draws the Bounding box to the screen.
         * A Bounding box is simply lines using the built in box() function of
         * processing.
         */
        public void render() {
                pushMatrix();
                        translate(x.floatValue(), y.floatValue(), z.floatValue());
                        stroke(r.floatValue(), g.floatValue(), b.floatValue(), a.floatValue());
                        noFill();
                        box(w.floatValue(), h.floatValue(), l.floatValue());
                popMatrix();
        }

}
