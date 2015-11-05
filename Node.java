import java.util.List;
import java.util.ArrayList;

public abstract class Node {

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

        List<Force> forces;

        Node(Float x, Float y, Float z,
             Float w, Float h, Float l,
             Float r, Float g, Float b, Float a) {
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
        }

        Node(Float x, Float y, Float z,
             Float w, Float h, Float l,
             Float r, Float g, Float b) {
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
}

