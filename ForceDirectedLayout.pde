/*
        Jake Mingolla
*/

final Integer DEFAULT_BACKGROUND  = 100;

BoundingBox box;

void setup() {
        size(displayWidth, displayHeight, P3D);
        background(DEFAULT_BACKGROUND);
        camera(Constants.CAMERA_EYE_X,
               Constants.CAMERA_EYE_Y,
               Constants.CAMERA_EYE_Z,
               Constants.CAMERA_CENTER_X,
               Constants.CAMERA_CENTER_Y,
               Constants.CAMERA_CENTER_Z,
               Constants.CAMERA_UP_X,
               Constants.CAMERA_UP_Y,
               Constants.CAMERA_UP_Z);
        lights();
        box = new BoundingBox();

}

void draw() {
        box.render();
}
