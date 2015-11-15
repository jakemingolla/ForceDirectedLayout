/**
 * @author jakemingolla
 * @since 1.0
 *
 * Abstract class to extend the Applicator generalizable class to handle
 * Applicators of exactly two arguments.
 */
public abstract class SecondOrderApplicator extends Applicator {

        /**
         * @author jakemingolla
         *
         * Creates an instance of the Second Order Applicator for
         * the given class list.
         *
         * Note that the class list must have a length of exactly two.
         */
        SecondOrderApplicator(Class... classes) {
                super(2, classes);
        }

        /**
         * @author jakemingolla
         *
         * Wrapper for the apply function, passes chain of command up
         * to the generalizable Applicator superclass since no more
         * processing is needed for a Second Order Applicator.
         */
        protected void apply(Object... args) {
                super.apply(args);
        }
}
