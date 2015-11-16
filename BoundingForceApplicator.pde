/**
 * @author jakemingolla
 * @since 1.0
 *
 * Applicator to apply a force to each Atom to make sure they are inside
 * the given bounding box.
 *
 * @see BoundingBox
 * @see Atom
 * @see Force
 */
public class BoundingForceApplicator extends FirstOrderApplicator {
        
       /* Bounding box stored as closure for the applicator. Cannot be
        * changed during runtime to prevent misuse. */
       private final  BoundingBox boundingBox;

       /**
        * @author jakemingolla
        *
        * Constructor for the Bounding Force Applicator given a specific bounding
        * box object.
        *
        * @param boundingBox    The BoundingBox object instance desired to be used
        *                       to bound.
        */
       BoundingForceApplicator(BoundingBox boundingBox) {
               super(Atom.class);
               this.boundingBox = boundingBox;
       }

       /**
        * @author jakemingolla
        *
        * Overriden apply function for the Bounding Force Applicator. Given a single
        * Atom, creates a {@link Force} that will move the Atom back within the bounds
        * of the BoundingBox. Controlled by {@link Constants@DEFAULT_BOUNDING_FORCE}.
        *
        * @param args   List of the single Atom on which the force will be applied.
        */
       @Override
       public void apply(Object... args) {
                super.apply(args);

                Atom atom = (Atom)args[0];


                /* Store whether or not the bounding box can store the given Atom
                 * in each of the 3 Cartesian directions.
                 */
                Boolean canFitX = boundingBox.canIntersectX(atom);
                Boolean canFitY = boundingBox.canIntersectY(atom);
                Boolean canFitZ = boundingBox.canIntersectZ(atom);

                /* Number of unbounded dimensions of the current Atom in relation to
                 * the BoundingBox.
                 *
                 * Is stored as a Double for simplicity with division later to avoid casting,
                 * and doesn't provide a noticeable uncertainity. */
                Double unboundedDimensions = 0.0d;
                unboundedDimensions += (!canFitX ? 1.0d: 0.0d);
                unboundedDimensions += (!canFitY ? 1.0d: 0.0d);
                unboundedDimensions += (!canFitZ ? 1.0d: 0.0d);

                Double magnitude = Constants.DEFAULT_BOUNDING_FORCE;

                /* For each of the Cartesian directions we are checking for fit, add the
                 * force in the proper direction with relation to the Atom and the BoundingBox
                 * with proportional X, Y, or Z in relation to the number of unbounded dimensions. */
                if (!canFitX) {
                        Double xDiff = boundingBox.getXDiff(atom);
                        Force f = new Force()
                                        .withX(Utilities.getSign(xDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }
                if (!canFitY) {
                        Double yDiff = boundingBox.getXDiff(atom);
                        Force f = new Force()
                                        .withY(Utilities.getSign(yDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }
                if (!canFitZ) {
                        Double zDiff = boundingBox.getXDiff(atom);
                        Force f = new Force()
                                        .withZ(Utilities.getSign(zDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }

       }
}
