public class BoundingForceApplicator<Node> extends SecondOrderApplicator<Node> {
        

        BoundingForceApplicator(Class c, Object[] closure) {
                super(c, closure);
        }

        @Override
        public void apply(Node... args) {
                super.apply(args);

                Node a = args[0];
                Node b = args[1];

                BoundingBox boundingBox;
                Atom atom;

                if (a instanceof BoundingBox && b instanceof Atom) {
                        boundingBox = (BoundingBox)a;
                        atom = (Atom)b;
                } else if (a instanceof Atom && b instanceof BoundingBox) {
                        atom = (Atom)a;
                        boundingBox = (BoundingBox)b;
                } else {
                        return;
                }

                Boolean canFitX = false;
                Boolean canFitY = false;
                Boolean canFitZ = false;

                Double unboundedDimensions = 0.0d;
                unboundedDimensions += (canFitX ? 1.0d : 0.0d);
                unboundedDimensions += (canFitY ? 1.0d : 0.0d);
                unboundedDimensions += (canFitZ ? 1.0d : 0.0d);

                Double magnitude = Constants.DEFAULT_BOUNDING_BOX_FORCE;

                if (canFitX) {
                        Double xDiff = ((Node)boundingBox).getXDiff((Node)atom);
                        Force f = new Force()
                                        .withX(Utilities.getSign(xDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }
                if (canFitY) {
                        Double yDiff = ((Node)boundingBox).getXDiff((Node)atom);
                        Force f = new Force()
                                        .withY(Utilities.getSign(yDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }

                if (canFitX) {
                        Double zDiff = ((Node)boundingBox).getZDiff((Node)atom);
                        Force f = new Force()
                                        .withZ(Utilities.getSign(zDiff) / unboundedDimensions)
                                        .withMagnitude(magnitude);
                        atom.addForce(f);
                }
        }
}
