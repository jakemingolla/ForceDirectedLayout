/**
 * @author jakemingolla
 * @since 1.0
 *
 * Edge between two objects of the parameterized class T.
 * In a graph, this reprents an arbitrary connection between
 * a vertex.
 */
public abstract class Edge<T> {

        /* The vertices within the Edge. For convention, an Edge
         * can only contain two vertices. */
        protected T vertex1;
        protected T vertex2;

        /**
         * @author jakemingolla
         *
         * Constructor of an Edge between two vertices of the parameterized
         * type.
         *
         * @param vertex1   The first vertex within an Edge.
         * @param vertex2   The second vertex within an Edge.
         */
        Edge(T vertex1, T vertex2) {
                this.vertex1 = vertex1;
                this.vertex2 = vertex2;
        }

        /*
         *
         *      GETTERS AND SETTERS BELOW
         *
         */
        public T getVertex1() {
                return vertex1;
        }

        public T getVertex2() {
                return vertex2;
        }

        public void setVertex1(T vertex1) {
                this.vertex1 = vertex1;
        }
        public void setVertex2(T vertex2) {
                this.vertex2 = vertex2;
        }
}
