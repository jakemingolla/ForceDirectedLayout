import java.util.List;
import java.util.ArrayList;

public abstract class Node {

        private Float x;
        private Float y;
        private Float z;

        private Float w;
        private Float h;
        private Float l;

        private Float r;
        private Float b;
        private Float g;
        private Float a;

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
                this.a = 0f;

                this.forces = new ArrayList<Force>();
        }

        protected void render() {
        }

        protected void update() {
        }

}

