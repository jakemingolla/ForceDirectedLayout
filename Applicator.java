public abstract class Applicator<T> {

        protected Class c;
        protected Integer numArgs;
        protected Object[] closure;

        Applicator(Class c, Integer numArgs, Object[] closure) {
                this.c = c;
                this.numArgs = numArgs;
                this.closure = closure;
        }

        public Class getAppliedClass() {
                return c;
        }

        protected void apply(T... args) {
                assert(args.length == numArgs);
        }
}
