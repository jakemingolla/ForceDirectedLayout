public abstract class SecondOrderApplicator<T> extends Applicator<T> {

        SecondOrderApplicator(Class c, Object[] closure) {
                super(c, 2, closure);
        }

        protected void apply(T... args) {
                super.apply(args);
        }
}
