import java.util.List;

public abstract class Graph<Vertex, Edge> {

        protected List<Vertex> vertexList;
        protected List<Edge> edgeList;

        Graph(List<Vertex> vertexList, List<Edge> edgeList) {
                this.vertexList = vertexList;
                this.edgeList = edgeList;
        }
}
