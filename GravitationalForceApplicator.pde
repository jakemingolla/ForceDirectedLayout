/**
 * @author jakemingolla
 * @since 1.0
 *
 * Applicator to apply the Gravitational force on all Nodes that
 * are affected by gravity.
 *
 * @see Gravitational
 * @see Atom
 * @see Force
 */
public class GravitationalForceApplicator extends FirstOrderApplicator {
        
        
        /* Gravitational Force stored as closure for the applicator. */
        private Force gravitationalForce;

        /**
         * @author jakemingolla
         *
         * Constructor for the Gravitational Force Applicator given a specific
         * gravitational force.
         *
         * @param gravitationalForce     The gravitational force to apply to
         *                               all {@link Gravitational} objects.
         */
        GravitationalForceApplicator(Force gravitationalForce) {
                super(Gravitational.class);
                this.gravitationalForce = gravitationalForce;
        }

        /**
        * @author jakemingolla
        *
        * Sets the gravitational force to the given {@link Force} object.
        *
        * @param gravitationalForce   The new desired gravitational force.
        */
        public void setGravitationalForce(Force gravitationalForce) {
                this.gravitationalForce = gravitationalForce;
        }

        
        /**
         * @author jakemingolla
         *
         * Overriden apply function for the Gravitational Force Applicator. Given
         * a single {@link Atom}, creates a {@link Force} that will move the Atom
         * in the direction of the gravitation force.
         *
         * @param args  List of the single Atom on which the force will be applied.
         */
        @Override
        public void apply(Object... args) {
                super.apply(args);

                Atom atom = (Atom)args[0];

                atom.addForce(gravitationalForce);
        }
}
