public abstract class FirstOrderApplicator<T> extends Applicator<T> {

        FirstOrderApplicator(Class c, Object[] closure) {
                super(c, 1, closure);
        }

        public void apply(T a) {
                super.apply(a);
        }

}
