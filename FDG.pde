/*
        Jake Mingolla
*/

import java.util.List;
import java.util.ArrayList;

BoundingBox box;
ForceDirectedGraph forceDirectedGraph;
GravitationalForceApplicator gfa;
Double proxyMouseX;
Double proxyMouseY;

Float rotateLR;
Float rotateUD;

void setup() {
        size(800, 600, P3D);

        List<Node> nodes = new ArrayList<Node>();
        List<Edge> edges = new ArrayList<Edge>();

        rotateUD = 0.0f;
        rotateLR = 0.0f;

        Atom a = new Atom(100.0d, 100.0d, 100.0d);
        Atom b = new Atom(150.0d, 100.0d, 100.0d);
        Spring<Atom> s = new Spring<Atom>(a, b);
        box = new BoundingBox();

        nodes.add(box);
        nodes.add(a);
        nodes.add(b);

        edges.add(s);

        List<Applicator> applicatorList = new ArrayList<Applicator>();

        //CoulombForceApplicator cfa = new CoulombForceApplicator();
        //applicatorList.add(cfa);

        Force gravitationalForce = new Force()
                                        .withY(-1.0d)
                                        .withMagnitude(200.0d);
        gfa = new GravitationalForceApplicator(gravitationalForce);
        applicatorList.add(gfa);

        BoundingForceApplicator bfa = new BoundingForceApplicator(box);
        //applicatorList.add(bfa);

        forceDirectedGraph = new ForceDirectedGraph(nodes, edges,
                                                    applicatorList);

        proxyMouseX = (double)(float(mouseX));
        proxyMouseY = (double)(float(mouseY));
}

void draw() {
        lights();
        background(Constants.DEFAULT_BACKGROUND);
        setupProxyMouse();
        setupCamera();
        handleCameraTranslations();
        handleCameraRotations();
        handleGravity();

        handleAxes();
        forceDirectedGraph.update();
        forceDirectedGraph.render();
}

void handleGravity() {
        Float totalPortion = sqrt((rotateUD * rotateUD) + (rotateLR * rotateLR));
        Double xPortion = new Double(rotateLR / totalPortion);
        //println("xportion = " + xPortion);
        Double yPortion = new Double(rotateUD / (2 * PI));
        println("yportion = " + yPortion);
        Double zPortion = 0.0d;

        Force f = new Force()
                        .withX(xPortion)
                        .withY(yPortion)
                        .withZ(zPortion)
                        .withMagnitude(Constants.DEFAULT_GRAVITATIONAL_FORCE);

        gfa.setGravitationalForce(f);
}

void handleAxes() {
        pushStyle();
                // x is red
                stroke(255, 0, 0);
                line(0, 0, 0, 150, 0, 0);

                // Y is green
                stroke(0, 255, 0);
                line(0, 0, 0, 0, 150, 0);

                // Z is blue
                stroke(0, 0, 255);
                line(0, 0, 0, 0, 0, 150);
        popStyle();
}

void setupProxyMouse() {
        Double mouseXd = (double)float(mouseX);
        Double mouseYd = (double)float(mouseY);
        if (keyPressed && key == Constants.DEFAULT_CAMERA_ROTATE_KEY) {
                Double deltaX = mouseXd- proxyMouseX;
                Double deltaY = mouseYd - proxyMouseY;
                proxyMouseX += deltaX * 0.01;
                proxyMouseY += deltaY * 0.01;
        }
}

void setupCamera() {
        float cameraY = (height * Constants.DEFAULT_CAMERA_Y_FACTOR.floatValue());
        float fieldOfView = (PI * Constants.DEFAULT_CAMERA_FIELD_OF_VIEW_FACTOR.floatValue());
        float cameraZ = cameraY / tan(fieldOfView * Constants.DEFAULT_CAMERA_Z_FACTOR.floatValue());
        float aspectRatio = float(width) / float(height);
        
        perspective(fieldOfView, aspectRatio,
                    cameraZ / Constants.DEFAULT_CAMERA_RENDER_DISTANCE_FACTOR.floatValue(),
                    cameraZ * Constants.DEFAULT_CAMERA_RENDER_DISTANCE_FACTOR.floatValue());
}

void handleCameraTranslations() {
        translate(width * Constants.DEFAULT_CAMERA_EYE_X_FACTOR.floatValue(),
                  height * Constants.DEFAULT_CAMERA_EYE_Y_FACTOR.floatValue(),
                  0);
}

void handleCameraRotations() {
        // Note change to X and Y
        rotateLR = (PI * Constants.DEFAULT_CAMERA_ROTATE_X_BASE_FACTOR.floatValue() +
                   -1 * proxyMouseX.floatValue() / float(width) * PI * Constants.DEFAULT_CAMERA_ROTATE_X_MOUSE_FACTOR.floatValue());

        rotateUD = (PI * Constants.DEFAULT_CAMERA_ROTATE_Y_BASE_FACTOR.floatValue() +
                  -1 * proxyMouseY.floatValue() / float(height) * PI * Constants.DEFAULT_CAMERA_ROTATE_Y_MOUSE_FACTOR.floatValue());

        rotateX(rotateUD);
        rotateY(rotateLR);

}
                           
