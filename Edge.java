/**
 * @author jakemingolla
 * @since 1.0
 *
 * Abstract class to hold the information related to a Edge
 * within the graph. An Edge is defined as any object that
 * holds onto two instances of a typed parameter.
 *
 * As a convention, all Edges are un-directed.
 *
 * *** NOTE ***
 * As of 1.1, Edges must meet the {@link Updateable} interface.
 */
public abstract class Edge implements Updateable {

        /* The vertices within the Edge. For convention, an Edge
         * can only contain two vertices. */
         protected Object vertex1;
         protected Object vertex2;

        /* The required class of the vertex. */
         protected Class vertexClass;

        /**
         * @author jakemingolla
         *
         * Constructor of an Edge between two vertices of the parameterized
         * type.
         *
         * @param vertex1       The first vertex within an Edge.
         * @param vertex2       The second vertex within an Edge.
         * @param vertexClass   The class the vertices are required to implement.
         */
        Edge(Object vertex1, Object vertex2, Class vertexClass) {
                this.vertexClass = vertexClass;
                if (!(vertexClass.equals(vertex1.getClass())) ||
                    !(vertexClass.equals(vertex2.getClass()))) {
                        throw new IllegalArgumentException();
                }
                this.vertex1 = vertex1;
                this.vertex2 = vertex2;
        }

        /*
         *
         *      GETTERS AND SETTERS BELOW
         *
         */
        public Object getVertex1() {
                return vertex1;
        }

        public Object getVertex2() {
                return vertex2;
        }

        public Class getVertexClass() {
                return vertexClass;
        }

        public void setVertex1(Object vertex1) {
                if (!(vertexClass.equals(vertex1.getClass()))) {
                        throw new IllegalArgumentException();
                }
                this.vertex1 = vertex1;
        }
        public void setVertex2(Object vertex2) {
                if (!(vertexClass.equals(vertex2.getClass()))) {
                        throw new IllegalArgumentException();
                }
                this.vertex2 = vertex2;
        }
}
