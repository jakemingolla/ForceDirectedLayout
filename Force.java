/**
 * @author jakemingolla
 * @since 1.0
 *
 * Object that stores a Force vector in 3-Dimensonal Cartesian space.
 * A Force is defined as an object with x, y, and z portions ranging
 * from -1.0 to 1.0 that define a unit vector in the direction the
 * Force is pointing. The magnitude is any Double precision value greater
 * than 0. For clarity, a magnitude may not be represented as a negative
 * number to imply reversing it.
 */
public class Force {

        /* The Force's unit vector in the 3-Dimensonal Cartesian space. */
        private Double x, y, z;

        /* The Force's magnitude. Must be positive. */
        private Double magnitude;

        /**
         * @author jakemingolla
         *
         * Default constructor for a Force. Sets all x, y, and z portions
         * as well as the magnitude to zero.
         */
        Force() {
                this.x = 0.0;
                this.y = 0.0;
                this.z = 0.0;
                this.magnitude = 0.0;
        }

        Force(Double x, Double y, Double z, Double magnitude) {
                this.x = x;
                this.y = y;
                this.z = z;
                this.magnitude = magnitude;
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

        public Double getMagnitude() {
                return magnitude;
        }

        public void setX(Double x) {
                if (!Utilities.inUnit(x)) {
                        throw new IllegalArgumentException();
                } else {
                        this.x = x;
                }
        }

        public void setY(Double y) {
                if (!Utilities.inUnit(y)) {
                        throw new IllegalArgumentException();
                } else {
                        this.y = y;
                }
        }

        public void setZ(Double z) {
                if (!Utilities.inUnit(z)) {
                        throw new IllegalArgumentException();
                } else {
                        this.z = z;
                }
        }

        public Force reversedCopy() {
                return new Force()
                                .withX(x * -1.0)
                                .withY(y * -1.0)
                                .withZ(z * -1.0)
                                .withMagnitude(magnitude);
        }


        public void setMagnitude(Double magnitude) {
                this.magnitude = magnitude;
        }

        public Force withX(Double x) {
                this.setX(x);
                return this;
        }

        public Force withY(Double y) {
                this.setY(y);
                return this;
        }

        public Force withZ(Double z) {
                this.setZ(z);
                return this;
        }

        public Force withMagnitude(Double magnitude) {
                this.setMagnitude(magnitude);
                return this;
        }
}
