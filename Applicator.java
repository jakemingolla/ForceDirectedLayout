/**
 * @author jakemingolla
 * Applicator abstract class to apply functions onto groups
 * of objects. Given a number of arguments and classes for each
 * argument, allows for application of a generalizable function
 * across objects of the matching type.
 * Most commonly used with Nodes and Force.
 * {@link Node}
 * {@link Force}
 **/
public abstract class Applicator {

        protected Class[] classes;
        protected Integer numArgs;

        Applicator(Integer numArgs, Class... classes) {
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
