public abstract class SecondOrderApplicator<T> extends Applicator<T> {

        SecondOrderApplicator(Class c) {
                super(c, 2);
        }

        protected void apply(T a, T b) {
                super.apply(a, b);
        }
}
