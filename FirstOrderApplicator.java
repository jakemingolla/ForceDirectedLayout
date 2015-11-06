public abstract class FirstOrderApplicator<T> extends Applicator<T> {

        FirstOrderApplicator(Class c) {
                super(c, 1);
        }

        public void apply(T a) {
                super.apply(a);
        }

}
