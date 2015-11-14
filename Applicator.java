public abstract class Applicator {

        protected Class[] classes;
        protected Integer numArgs;

        Applicator(Integer numArgs, Class... classes) {
                System.out.println("Num args = " + numArgs);
                System.out.println("Classes len = " + classes.length);
                assert(classes.length == numArgs);
                this.numArgs = numArgs;
                this.classes = classes;
        }

        public Class[] getAppliedClasses() {
                return classes;
        }

        public Class getAppliedClassByIndex(Integer i) {
                assert(i < classes.length);
                return classes[i];
        }

        protected void apply(Object... args) {
                assert(args.length == numArgs);
                int length = args.length;
                for (int i = 0; i < length; i++) {
                        Class c = args[i].getClass();
                        assert(c.equals(getAppliedClassByIndex(i)));
                }
        }
}
