import java.util.List;

public abstract class Graph<V extends Node, E extends Edge> implements Renderable, Updateable {

        protected List<V> vertexList;
        protected List<E> edgeList;

        Graph(List<V> vertexList, List<E> edgeList) {
                this.vertexList = vertexList;
                this.edgeList = edgeList;
        }

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
