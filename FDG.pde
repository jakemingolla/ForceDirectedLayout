/*
        Jake Mingolla
*/

import java.util.List;
import java.util.ArrayList;

BoundingBox box;
ForceDirectedGraph forceDirectedGraph;
GravitationalForceApplicator gfa;
Parser parser;
Double proxyMouseX;
Double proxyMouseY;

Float rotateLR;
Float rotateUD;
String path = "/home/jake/Documents/FDG/data/data1.csv";

void setup() {
        size(800, 600, P3D);
        parser = new Parser();

        List<Node> nodes = null;
        try {
                nodes = parser.getAtoms(path);
        } catch (Parser.DuplicateIdentifierException ex) {
                println("ERROR: Duplicate identifier exception on identifier = " + ex.getMessage());
                println("FDG will most likely run into a fatal error.");
        }

        List<Edge> edges = null;
        try {
                edges = parser.getSprings(path);
        } catch (Parser.IllegalEdgeException ex) {
                println("ERROR: Illegal Edge Exception thrown -- " + ex.getMessage());
                println("FDG will most likely run into a fatal error.");
        }

        rotateUD = 0.0f;
        rotateLR = 0.0f;

        box = new BoundingBox();
        nodes.add(box);

        List<Applicator> applicatorList = new ArrayList<Applicator>();

        CoulombForceApplicator cfa = new CoulombForceApplicator();
        applicatorList.add(cfa);

        HookeForceApplicator hfa = new HookeForceApplicator();
        applicatorList.add(hfa);

        Force gravitationalForce = new Force()
                                        .withY(-1.0d)
                                        .withMagnitude(200.0d);
        gfa = new GravitationalForceApplicator(gravitationalForce);
        // Removing gravity for gif as of 12/5/15
        //applicatorList.add(gfa);

        BoundingForceApplicator bfa = new BoundingForceApplicator(box);
        applicatorList.add(bfa);

        forceDirectedGraph = new ForceDirectedGraph(nodes, edges,
                                                    applicatorList);

        proxyMouseX = (double)(width / 2);
        proxyMouseY = (double)(height / 2);
}

void draw() {
        lights();
        background(Constants.DEFAULT_BACKGROUND);
        setupProxyMouse();
        setupCamera();
        handleCameraTranslations();
        handleCameraRotations();
        handleGravity();

        // Removing axes drawing as of 12/5/15
        //handleAxes();
        forceDirectedGraph.update();
        forceDirectedGraph.render();
}

void handleGravity() {
        Double xPortion = new Double(sin(rotateUD) * sin(rotateLR));
        Double yPortion = new Double(cos(rotateUD));
        Double zPortion = new Double(-1 * sin(rotateUD) * cos(rotateLR));

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

                // white is up
                stroke(255, 255, 255);
                Double gravityX = new Double(sin(rotateUD) * sin(rotateLR));
                Double gravityY = new Double(cos(rotateUD));
                Double gravityZ = new Double(-1 * sin(rotateUD) * cos(rotateLR));
                Double gravityMagnitude = 100.0d;
                line(0, 0, 0,
                     gravityX.floatValue() * gravityMagnitude.floatValue(),
                     gravityY.floatValue() * gravityMagnitude.floatValue(),
                     gravityZ.floatValue() * gravityMagnitude.floatValue());


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
        rotateLR = -1 * (proxyMouseX.floatValue() / float(width) * TWO_PI);
        rotateUD = -1 * (proxyMouseY.floatValue() / float(height) * TWO_PI);

        rotateX(rotateUD);
        rotateY(rotateLR);

}
                           
