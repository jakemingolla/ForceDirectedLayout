import java.util.List;

/**
 * @author jakemingolla
 * @since 1.0
 *
 * Abstract class to store information of a Graph. A graph is defined as having
 * a list of vertices and edges to correspond to the information of the Graph.
 * All vertices and edges must instantiate or inherit their respective
 * parameterized type.
 *
 * By default, all Graph objects are instances of {@link Renderable} and
 * {@link Updateable} for ease of interaction with the scene, but this will
 * likely be changed in a later version.
 * 
 * @see Node
 * @see Edge
 */
public abstract class Graph<V extends Node, E extends Edge> implements Renderable, Updateable {

        /* List of all of the vertices implementing the parameterized type V. */
        protected List<V> vertexList;
        /* List of all of the veritces implementing the parameterized type E. */
        protected List<E> edgeList;

        /**
         * @author jakemingolla
         *
         * Default constructor for a graph given lists of vertices and edges of the
         * respective parameterized type.
         *
         * @param vertexList    List of vertex objects to attach to the Graph.
         * @param edgeList      List of edge objects to attach to the Graph.
         *
         * @see Node
         * @see Edge
         */
        Graph(List<V> vertexList, List<E> edgeList) {
                this.vertexList = vertexList;
                this.edgeList = edgeList;
        }

        /**
         * @author jakemingolla
         *
         * Overriden update function that will iterate through each of the
         * vertex and edge lists and call the respective object's
         * update function.
         */
        @Override
        public void update() {
                for (Node node : vertexList) {
                        if (node instanceof Updateable) {
                                ((Updateable)node).update();
                        }
                }

                for (Edge edge : edgeList) {
                        if (edge instanceof Updateable) {
                                ((Updateable)edge).update();
                        }
                }
        }

        /**
         * @author jakemingolla
         *
         * Overriden render function that will iterate through each of the
         * vertex and edge lists and call the respective object's
         * render function.
         */
        @Override
        public void render() {
                for (Node node : vertexList) {
                        if (node instanceof Renderable) {
                                ((Renderable)node).render();
                        }
                }

                for (Edge edge : edgeList) {
                        if (edge instanceof Renderable) {
                                ((Renderable)edge).render();
                        }
                }
        }
}
