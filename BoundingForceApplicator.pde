public class BoundingForceApplicator extends FirstOrderApplicator {
        
       BoundingBox boundingBox;

       BoundingForceApplicator(BoundingBox boundingBox) {
               super(Atom.class);
               this.boundingBox = boundingBox;
       }

       @Override
       public void apply(Object... args) {
                super.apply(args);

                Atom atom = (Atom)args[0];


                Boolean canFitX = false;
                Boolean canFitY = false;
                Boolean canFitZ = false;

                Double unboundedDimensions = 0.0d;
                unboundedDimensions += (canFitX ? 1.0d: 0.0d);
                unboundedDimensions += (canFitY ? 1.0d: 0.0d);
                unboundedDimensions += (canFitZ ? 1.0d: 0.0d);

                Double magnitude = Constants.DEFAULT_BOUNDING_FORCE;

                if (canFitX) {
                        Double xDiff = boundingBox.getXDiff(atom);
                        Force f = new Force()
                                        .withX(Utilities.getSign(xDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }
                if (canFitY) {
                        Double yDiff = boundingBox.getXDiff(atom);
                        Force f = new Force()
                                        .withY(Utilities.getSign(yDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }
                if (canFitX) {
                        Double zDiff = boundingBox.getXDiff(atom);
                        Force f = new Force()
                                        .withZ(Utilities.getSign(zDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }

       }
}
