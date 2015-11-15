/**
 * @author jakemingolla
 * @since 1.0
 *
 * Abstract class to extend the Applicator generalizable class to handle
 * Applicators of exactly one argument.
 */
public abstract class FirstOrderApplicator extends Applicator {

        /**
         * @author jakemingolla
         *
         * Creates an instance of the First Order Applicator
         * for the given class list.
         *
         * Note that even though it supports variable arguments to pass
         * in the class list, only 1 class is allowed since this is a 
         * First Order Applicator
         */
        FirstOrderApplicator(Class... classes) {
                super(1, classes);
        }

        /**
         * @author jakemingolla
         *
         * Wrapper for the apply function, passes chain of command up
         * to the generalizable Applicator superclass since no more
         * processing is needed for a First Order Applicator.
         */
        public void apply(Object... args) {
                super.apply(args);
        }

}
