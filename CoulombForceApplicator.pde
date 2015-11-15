/**
 * @author jakemingolla
 * @since 1.0
 *
 * Applicator to apply the Couloumb force between Atoms. Atoms will
 * repel eachother inverse proportionally to their distance.
 *
 * @see <a href="https://en.wikipedia.org/wiki/Coulomb%27s_law"</a>
 * @see Atom
 * @see Force
 */
public class CoulombForceApplicator extends SecondOrderApplicator {

        /**
         * @author jakemingolla
         *
         * Default constructor for the Coulomb Force Applicator.
         */
        CoulombForceApplicator() {
                super(Atom.class, Atom.class);
        }

        /**
         * @author jakemingolla
         *
         * Overriden apply function for the Coulomb Force Applicator. Given
         * two Atoms, creates a {@link Force} with magnitude inversely proportional 
         * to the distance between them in the direction away from eachother.
         * Controlled by the {@link Constants#DEFAULT_COULOMB_CONSTANT}.
         *
         * @param args  List of the two Atom objects to apply the forces to.
         */
        @Override
        public void apply(Object... args) {
                super.apply(args);

                Atom a = (Atom)args[0];
                Atom b = (Atom)args[1];

                Double distance = Utilities.bound(a.getDistance(b));

                /* Proportion of the force applied onto a in relation
                 * to b's distance difference to a. */
                Double xPortion = Utilities.bound(a.getXDiff(b));
                Double yPortion = Utilities.bound(a.getYDiff(b));
                Double zPortion = Utilities.bound(a.getZDiff(b));

                /* The Coulomb force is inversely proportional to the distance between
                 * the two Atoms. */
                Double coulombMagnitude = Constants.DEFAULT_COULOMB_CONSTANT / distance;

                Force f = new Force()
                        .withX(Utilities.bound(xPortion / distance))
                        .withY(Utilities.bound(yPortion / distance))
                        .withZ(Utilities.bound(zPortion / distance))
                        .withMagnitude(coulombMagnitude);

                a.addForce(f);
                /* The force applied to b has exactly the same magnitude but with reversed
                 * direction, so we can simply add a reversed copy. */
                b.addForce(f.reversedCopy());
        }
}
