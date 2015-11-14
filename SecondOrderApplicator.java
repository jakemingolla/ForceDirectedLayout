public abstract class SecondOrderApplicator extends Applicator {

        SecondOrderApplicator(Class... classes) {
                super(2, classes);
        }

        protected void apply(Object... args) {
                super.apply(args);
        }
}
