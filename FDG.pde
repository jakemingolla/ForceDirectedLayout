/*
        Jake Mingolla
*/

import java.util.List;
import java.util.ArrayList;

BoundingBox box;
ForceDirectedGraph forceDirectedGraph;
Double proxyMouseX;
Double proxyMouseY;

void setup() {
        size(800, 600, P3D);

        List<Node> nodes = new ArrayList<Node>();
        List<Edge> edges = new ArrayList<Edge>();

        Atom a = new Atom(100.0d, 100.0d, 100.0d);
        Atom b = new Atom(150.0d, 150.0d, 150.0d);
        Spring<Atom> s = new Spring<Atom>(a, b);
        box = new BoundingBox();

        nodes.add(box);
        nodes.add(a);
        nodes.add(b);

        edges.add(s);

        List<FirstOrderApplicator> firstOrderApplicatorList = new ArrayList<FirstOrderApplicator>();
        List<SecondOrderApplicator> secondOrderApplicatorList = new ArrayList<SecondOrderApplicator>();

        CouloumbForceApplicator<Atom> cfa = new CouloumbForceApplicator<Atom>(Atom.class);
        secondOrderApplicatorList.add(cfa);



        forceDirectedGraph = new ForceDirectedGraph(nodes, edges,
                                                    firstOrderApplicatorList,
                                                    secondOrderApplicatorList);

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

        forceDirectedGraph.update();
        forceDirectedGraph.render();

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
        rotateX(PI * Constants.DEFAULT_CAMERA_ROTATE_X_BASE_FACTOR.floatValue() +
                -1 * proxyMouseY.floatValue() / float(width) * PI * Constants.DEFAULT_CAMERA_ROTATE_X_MOUSE_FACTOR.floatValue());

        rotateY(PI * Constants.DEFAULT_CAMERA_ROTATE_Y_BASE_FACTOR.floatValue() +
                -1 * proxyMouseX.floatValue() / float(height) * PI * Constants.DEFAULT_CAMERA_ROTATE_Y_MOUSE_FACTOR.floatValue());
}
                           
