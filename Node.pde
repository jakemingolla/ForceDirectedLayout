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
                System.out.println("Creating node at (" + x + ", " + y +
                                   ", " + z + ") with dimensions " + w +
                                   " x " + h + " x " + l + " and color (" +
                                   r + ", " + g + ", " + b + ", " + a +
                                   ").");
                                   

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

        protected void render() {
        }

        protected void update() {
        }

}

