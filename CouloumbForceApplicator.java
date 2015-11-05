public class CouloumbForceApplicator<Atom extends Node> implements NodeForceApplicator<Atom> {

        public void apply(Atom a, Atom b) {
                Force f = new Force().withX(-1.0).withMagnitude(10.0);
                a.addForce(f);
                a.addForce(f);
        }
}
