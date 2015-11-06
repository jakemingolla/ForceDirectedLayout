public abstract class SecondOrderApplicator<T> {

        Class c;

        SecondOrderApplicator(Class typeOf) {
                c = typeOf;
        }

        public Class getAppliedClass() {
                return c;
        }


        protected void apply(T a, T b) {
                throw new NullPointerException();
        }
}
