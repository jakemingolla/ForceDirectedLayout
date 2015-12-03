/**
 * @author jakemingolla
 * @since 1.1
 *
 * Applicator to apply Hooke's Law to each group of {@link Atom}
 * objects within each {@link Spring} object. Each spring
 * must be given an ideal length to which the spring will naturally
 * try and achieve.
 *
 * https://en.wikipedia.org/wiki/Hooke%27s_law
 *
 * @see Atom
 * @see Spring
 * @see Force
 */
public class HookeForceApplicator extends FirstOrderApplicator {

        /**
         * @author jakemingolla
         *
         * Constructor for the Hooke Force Applicator.
         */
        HookeForceApplicator() {
                super(Spring.class);
        }

        /**
         * @author jakemingolla
         *
         * Overriden apply function for the Hooke's Force Applicator. Given
         * a single {@link Spring}, applies a force to each of the {@link Atom}
         * vertices within the edge towards the ideal length of the Spring.
         *
         * @param args  List of the single Spring on which the force will be applied.
         */
         @Override
        public void apply(Object... args) {
                super.apply(args);

                Spring s = (Spring)args[0];
                Double idealLength = s.getIdealLength();

                Atom a = (Atom)s.getVertex1();
                Atom b = (Atom)s.getVertex2();

                Double distance = Utilities.bound(a.getDistance(b));
                Double delta = Utilities.bound(distance - idealLength);

                Double xPortion = Utilities.bound(a.getXDiff(b));
                Double yPortion = Utilities.bound(a.getYDiff(b));
                Double zPortion = Utilities.bound(a.getZDiff(b));

                Double hookeMagnitude = Constants.DEFAULT_HOOKE_CONSTANT * delta;

                Force f = new Force()
                        .withX(Utilities.bound(xPortion / distance))
                        .withY(Utilities.bound(yPortion / distance))
                        .withZ(Utilities.bound(zPortion / distance))
                        .withMagnitude(hookeMagnitude);

                a.addForce(f.reversedCopy());
                b.addForce(f);
        }
}
