import java.util.List;
import java.util.ArrayList;
import static java.lang.Math.sqrt;

public abstract class Node implements Updateable {

        protected Double x;
        protected Double y;
        protected Double z;

        protected Double w;
        protected Double h;
        protected Double l;

        protected Double r;
        protected Double b;
        protected Double g;
        protected Double a;

        protected Double vX;
        protected Double vY;
        protected Double vZ;

        protected Double weight;

        List<Force> forces;

        Node(Double weight,
             Double x, Double y, Double z,
             Double w, Double h, Double l,
             Double r, Double g, Double b, Double a) {
                this.weight = weight;

                this.x = x;
                this.y = y;
                this.z = z;

                this.w = w;
                this.h = h;
                this.l = l;

                this.r = r;
                this.g = g;
                this.b = b;
                this.a = a;

                this.forces = new ArrayList<Force>();

                this.vX = 0.0;
                this.vY = 0.0;
                this.vZ = 0.0;
        }

        Node(Double weight,
             Double x, Double y, Double z,
             Double w, Double h, Double l,
             Double r, Double g, Double b) {
                this.weight = weight;

                this.x = x;
                this.y = y;
                this.z = z;

                this.w = w;
                this.h = h;
                this.l = l;

                this.r = r;
                this.g = g;
                this.b = b;
                this.a = 255.0;

                this.forces = new ArrayList<Force>();

                this.vX = 0.0;
                this.vY = 0.0;
                this.vZ = 0.0;
        }

        public void update() {
                Double magnitude = sqrt((vX * vX) + (vY * vY) + (vZ * vZ));

                if (magnitude > Utilities.EPSILON) {
                        Force friction = new Force()
                                                .withX((-1.0d * vX) / magnitude)
                                                .withY((-1.0d * vY) / magnitude)
                                                .withZ((-1.0d * vZ) / magnitude)
                                                .withMagnitude(magnitude * Constants.DEFAULT_FRICTION_FACTOR);
                        addForce(friction);
                }

                Double xTotal = 0.0d;
                Double yTotal = 0.0d;
                Double zTotal = 0.0d;

                for (Force f : forces) {
                        magnitude = f.getMagnitude();
                        xTotal += f.getX() * magnitude;
                        yTotal += f.getY() * magnitude;
                        zTotal += f.getZ() * magnitude;
                }

                Double xAcceleration = (xTotal / weight);
                Double yAcceleration = (yTotal / weight);
                Double zAcceleration = (zTotal / weight);

                vX += xAcceleration;
                vY += yAcceleration;
                vZ += zAcceleration;

                x += vX;
                y += vY;
                z += vZ;

                clearForces();
        }

        public void addForce(Force f) {
                System.out.println("Creating new force with x=" + f.getX() + " y=" + f.getY() + " z=" + f.getZ() + " m=" + f.getMagnitude());
                forces.add(f);
        }

        public void clearForces() {
                forces.clear();
        } 

        public void setWeight(Double weight) {
                this.weight = weight;
        }
        public void setX(Double x) {
                this.x = x;
        }
        public void setY(Double y) {
                this.y = y;
        }
        public void setZ(Double z) {
                this.z = z;
        }
        public void setW(Double w) {
                this.w = w;
        }
        public void setH(Double l) {
                this.h = h;
        }
        public void setL(Double l) {
                this.l = l;
        }
        public void setR(Double r) {
                this.r = r;
        }
        public void setG(Double g) {
                this.g = g;
        }
        public void setB(Double b) {
                this.b = b;
        }
        public void setA(Double a) {
                this.a = a;
        }
        public void setVX(Double vX) {
                this.vX = vX;
        }
        public void setVY(Double vY) {
                this.vY = vY;
        }
        public void setVZ(Double vZ) {
                this.vZ = vZ;
        }

        public Double getWeight() {
                return weight;
        }
        public Double getX() {
                return x;
        }
        public Double getY() {
                return y;
        }
        public Double getZ() {
                return z;
        }
        public Double getW() {
                return w;
        }
        public Double getH() {
                return h;
        }
        public Double getL() {
                return l;
        }
        public Double getR() {
                return r;
        }
        public Double getG() {
                return g;
        }
        public Double getB() {
                return b;
        }
        public Double getA() {
                return a;
        }
        public Double getVX() {
                return vX;
        }
        public Double getVY() {
                return vY;
        }
        public Double getVZ() {
                return vZ;
        }
}

