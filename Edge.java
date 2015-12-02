/**
 * @author jakemingolla
 * @since 1.0
 *
 * Abstract class to hold the information related to a Edge
 * within the graph. An Edge is defined as any object that
 * holds onto two instances of a typed parameter.
 *
 * As a convention, all Edges are un-directed.
 */
public abstract class Edge<T> {

        /*
         * The vertex information of the parameterized type T.
         */
        protected T vertex1;
        protected T vertex2;

        /**
         * @author jakemingolla
         *
         * Default constructor for an Edge given two vertices.
         *
         * @param vertex1       The first vertex within the Edge.
         * @param vertex2       The second vertex within the Edge.
         */
        Edge(T vertex1, T vertex2) {
                this.vertex1 = vertex1;
                this.vertex2 = vertex2;
        }

        /*
         *
         * Getters and Setters Below.
         *
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
