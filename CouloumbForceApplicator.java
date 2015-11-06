public class CouloumbForceApplicator<Atom> extends SecondOrderApplicator<Atom> {

        CouloumbForceApplicator(Class typeOf) {
                super(typeOf);
        }

        @Override
        public void apply(Atom... args) {
                super.apply(args);

                Atom a = args[0];
                Atom b = args[1];

                Double distance = Utilities.bound(((Node)a).getDistance((Node)b));

                Double xPortion = Utilities.bound(((Node)a).getXDiff((Node)b));
                Double yPortion = Utilities.bound(((Node)a).getYDiff((Node)b));
                Double zPortion = Utilities.bound(((Node)a).getZDiff((Node)b));

                Double couloumbMagnitude = Constants.DEFAULT_COULOUMB_CONSTANT / distance;

                Force f = new Force()
                        .withX(Utilities.bound(xPortion / distance))
                        .withY(Utilities.bound(yPortion / distance))
                        .withZ(Utilities.bound(zPortion / distance))
                        .withMagnitude(couloumbMagnitude);

                ((Node)a).addForce(f);
                ((Node)b).addForce(f.reversedCopy());
        }
}
