public abstract class SecondOrderApplicator<T> extends Applicator<T> {

        SecondOrderApplicator(Class c) {
                super(c, 2);
        }

        protected void apply(T... args) {
                super.apply(args);
        }
}
