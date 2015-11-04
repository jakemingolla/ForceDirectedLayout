public class Force {

        private Float x, y, z;
        private Float magnitude;

        Force() {
                this.x = 0f;
                this.y = 0f;
                this.z = 0f;
                this.magnitude = 0f;
        }

        Force(Float x, Float y, Float z, Float magnitude) {
                this.x = x;
                this.y = y;
                this.z = z;
                this.magnitude = magnitude;
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

        public Float getMagnitude() {
                return magnitude;
        }

        public void setX(Float x) {
                if (!Utilities.inUnit(x)) {
                        throw new IllegalArgumentException();
                } else {
                        this.x = x;
                }
        }

        public void setY(Float y) {
                if (!Utilities.inUnit(y)) {
                        throw new IllegalArgumentException();
                } else {
                        this.y = y;
                }
        }

        public void setZ(Float z) {
                if (!Utilities.inUnit(z)) {
                        throw new IllegalArgumentException();
                } else {
                        this.z = z;
                }
        }

        public void setMagnitude(Float magnitude) {
                this.magnitude = magnitude;
        }

        public Force withX(Float x) {
                this.setX(x);
                return this;
        }

        public Force withY(Float y) {
                this.setY(y);
                return this;
        }

        public Force withZ(Float z) {
                this.setZ(z);
                return this;
        }

        public Force withMagnitude(Float magnitude) {
                this.setMagnitude(magnitude);
                return this;
        }
}
