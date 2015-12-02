/**
 * @author jakemingolla
 * @since 1.0
 *
 * Applicator abstract class to apply functions onto groups
 * of objects. Given a number of arguments and classes for each
 * argument, allows for application of a generalizable function
 * across objects of the matching type.
 *
 * Most commonly used with Nodes and Force.
 * {@link Node}
 * {@link Force}
 */
public abstract class Applicator {

        /* List of classes, in order, of the objects necesarry to be
         * pased to the apply function */
        protected Class[] classes;

        /* Number of arguments for the inheriting applicator class. */
        protected Integer numArgs;

        /**
         * @author jakemingolla
         *
         * Creates an instance of the Applicator object with the given
         * number of arguments and classes. 
         *
         * *** NOTE *** the number of arguments must be exactly equal
         * to the length of the variable argument array the classes
         * is passed in as.
         *
         * @param numArgs       The number of arguments to the Applicator.
         * @param classes       The classes, in order, the apply function must
         *                      be given.
         */
        Applicator(Integer numArgs, Class... classes) {
                assert(classes.length == numArgs);
                this.numArgs = numArgs;
                this.classes = classes;
        }

        /**
         * @author jakemingolla
         *
         * Gets a list of the required classes for the apply function.
         *
         * @return      List, in order, of the classes required for the apply function.
         */
        public Class[] getAppliedClasses() {
                return classes;
        }

        /**
         * @author jakemingolla
         *
         * Gets a specific class required for the apply function at the given index.
         *
         * @param i     The Integer index to get back the applied class. Cannot be negative
         *              or greater than the length of the applied class list. @see getNumArgs
         * @return      The specific Class object required at the specified index.
         */
        public Class getAppliedClassByIndex(Integer i) {
                assert(i >= 0 && i < classes.length);
                return classes[i];
        }

        /**
         * @author jakemingolla
         *
         * Gets the number of arguments necessary for the given applicator instance.
         *
         * @return      The Integer number of arguments necessary for the given applicator instance.
         */
        public Integer getNumArgs() {
                return numArgs;
        }

        /**
         * @author jakemingolla
         *
         * Function tied to the Applicator. Asserts that the number of arugments as well as the classes of
         * each individual arugment matches the Applicator's instance variables.
         *
         * ***NOTE*** <b>MUST</b> be called as "super.apply(args)" when overriding in a Applicator
         * inheriting this method in order to guarantee accuracy of caller's arguments in relation
         * to number of arguments and proper class.
         *
         * As of 11/16/2015 supports interfaces as applied classes.
         */
        protected void apply(Object... args) {
                assert(args.length == numArgs);

                int length = args.length;
                for (int i = 0; i < length; i++) {
                        Class c = args[i].getClass();
                        Class applied = getAppliedClassByIndex(i);
                        if(!(c.equals(applied) || applied.isInstance(args[i]))) {
                                throw new IllegalArgumentException();
                        }
                }
        }
}
