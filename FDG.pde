/*
        Jake Mingolla
*/

import java.util.List;
import java.util.ArrayList;

BoundingBox box;
ForceDirectedGraph forceDirectedGraph;
Float proxyMouseX;
Float proxyMouseY;

void setup() {
        size(800, 600, P3D);

        List<Node> nodes = new ArrayList<Node>();
        List<Edge> edges = new ArrayList<Edge>();

        Atom a = new Atom(100f, 100f, 100f);
        Atom b = new Atom(150f, 150f, 150f);
        Spring<Atom> s = new Spring<Atom>(a, b);
        box = new BoundingBox();

        nodes.add(box);
        nodes.add(a);
        nodes.add(b);

        edges.add(s);

        forceDirectedGraph = new ForceDirectedGraph(nodes, edges);

        proxyMouseX = float(mouseX);
        proxyMouseY = float(mouseY);
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
        Float mouseXf = float(mouseX);
        Float mouseYf = float(mouseY);
        if (keyPressed && key == Constants.DEFAULT_CAMERA_ROTATE_KEY) {
                Float deltaX = mouseXf- proxyMouseX;
                Float deltaY = mouseYf - proxyMouseY;
                println("proxyMouseX = " + proxyMouseX);
                println("delta X = " + deltaX);
                proxyMouseX += deltaX * 0.01;
                proxyMouseY += deltaY * 0.01;
        }
}

void setupCamera() {
        float cameraY = height * Constants.DEFAULT_CAMERA_Y_FACTOR;
        float fieldOfView = PI * Constants.DEFAULT_CAMERA_FIELD_OF_VIEW_FACTOR;
        float cameraZ = cameraY / tan(fieldOfView * Constants.DEFAULT_CAMERA_Z_FACTOR);
        float aspectRatio = float(width) / float(height);
        
        perspective(fieldOfView, aspectRatio,
                    cameraZ / Constants.DEFAULT_CAMERA_RENDER_DISTANCE_FACTOR,
                    cameraZ * Constants.DEFAULT_CAMERA_RENDER_DISTANCE_FACTOR);
}

void handleCameraTranslations() {
        translate(width * Constants.DEFAULT_CAMERA_EYE_X_FACTOR,
                  height * Constants.DEFAULT_CAMERA_EYE_Y_FACTOR,
                  0);
}

void handleCameraRotations() {
        rotateX(PI * Constants.DEFAULT_CAMERA_ROTATE_X_BASE_FACTOR +
                -1 * proxyMouseY / float(width) * PI * Constants.DEFAULT_CAMERA_ROTATE_X_MOUSE_FACTOR);

        rotateY(PI * Constants.DEFAULT_CAMERA_ROTATE_Y_BASE_FACTOR +
                -1 * proxyMouseX / float(height) * PI * Constants.DEFAULT_CAMERA_ROTATE_Y_MOUSE_FACTOR);
}
                           
