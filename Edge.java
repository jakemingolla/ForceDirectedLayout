public abstract class Edge<T> {
        protected T vertex1;
        protected T vertex2;

        Edge(T vertex1, T vertex2) {
                this.vertex1 = vertex1;
                this.vertex2 = vertex2;
        }

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
