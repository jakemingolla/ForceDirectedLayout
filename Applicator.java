public abstract class Applicator<T> {

        Class c;
        Integer numArgs;

        Applicator(Class c, Integer numArgs) {
                this.c = c;
                this.numArgs = numArgs;
        }

        public Class getAppliedClass() {
                return c;
        }

        protected void apply(T... args) {
                System.out.println("12");
                assert(args.length == numArgs);
        }
}
