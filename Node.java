import java.util.List;
import java.util.ArrayList;

public abstract class Node implements Updateable {

        protected Float x;
        protected Float y;
        protected Float z;

        protected Float w;
        protected Float h;
        protected Float l;

        protected Float r;
        protected Float b;
        protected Float g;
        protected Float a;

        protected Float vX;
        protected Float vY;
        protected Float vZ;

        protected Float weight;

        List<Force> forces;

        Node(Float weight,
             Float x, Float y, Float z,
             Float w, Float h, Float l,
             Float r, Float g, Float b, Float a) {
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

                this.vX = 0f;
                this.vY = 0f;
                this.vZ = 0f;
        }

        Node(Float weight,
             Float x, Float y, Float z,
             Float w, Float h, Float l,
             Float r, Float g, Float b) {
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
                this.a = 255f;

                this.forces = new ArrayList<Force>();

                this.vX = 0f;
                this.vY = 0f;
                this.vZ = 0f;
        }

        public void update() {
                Float magnitude = sqrt((vX * vX) + (vY * vY) + (vZ * vZ));

                if (magnitude > Utilities.EPSILON) {
                        Force friction = new Force();
                        friction.x = (-1f * vx) / magnitude;
                        friction.y = (-1f * vy) / magnitude;
                        friction.z = (-1f * vz) / magnitude;
                        friction.magnitude = magnitude * Constants.DEFAULT_FRICTION_FACTOR;
                        addForce(friction);
                }

                Float xTotal = 0f;
                Float yTotal = 0f;
                Float zTotal = 0f;

                for (Force f : forces) {
                        magnitude = f.getMagnitude();
                        xTotal += f.getX() * magnitude;
                        yTotal += f.getY() * magnitude;
                        zTotal += f.getZ() * magnitude;
                }

                Float xAcceleration = (xTotal * weight);
                Float yAcceleration = (yTotal * weight);
                Float zAcceleration = (zTotal * weight);

                vX += xAcceleration;
                vY += yAcceleration;
                vZ += zAcceleration;

                x += vX;
                y += vY;
                z += vZ;

                clearForces();
        }

        public void addForce(Force f) {
                forces.add(f);
        }

        public void clearForces() {
                forces.clear();

        public void setWeight(Float weight) {
                this.weight = weight;
        }
        public void setX(Float x) {
                this.x = x;
        }
        public void setY(Float y) {
                this.y = y;
        }
        public void setZ(Float z) {
                this.z = z;
        }
        public void setW(Float w) {
                this.w = w;
        }
        public void setH(Float l) {
                this.h = h;
        }
        public void setL(Float l) {
                this.l = l;
        }
        public void setR(Float r) {
                this.r = r;
        }
        public void setG(Float g) {
                this.g = g;
        }
        public void setB(Float b) {
                this.b = b;
        }
        public void setA(Float a) {
                this.a = a;
        }
        public void setVX(Float vX) {
                this.vX = vX;
        }
        public void setVY(Float vY) {
                this.vY = vY;
        }
        public void setVZ(Float vZ) {
                this.vZ = vZ;
        }

        public Float getWeight() {
                return weight;
        }
        public Float getX() {
                return x;
        }
        public Float getY() {
                return y;
        }
        public Float getZ() {
                return z;
        }
        public Float getW() {
                return w;
        }
        public Float getH() {
                return h;
        }
        public Float getL() {
                return l;
        }
        public Float getR() {
                return r;
        }
        public Float getG() {
                return g;
        }
        public Float getB() {
                return b;
        }
        public Float getA() {
                return a;
        }
        public Float getVX() {
                return vX;
        }
        public Float getVX() {
                return vY;
        }
        public Float getVZ() {
                return vZ;
        }
}

