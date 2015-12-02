/**
 * @author jakemingolla
 * @since 1.0
 *
 * Collection of utilities for mathematical operations common
 * to the Force Directed Graph. 
 */
public class Utilities {

        /* Epsilon value for all mathematical calculations. This
         * simplifies all math related to figuring out double
         * precision operations in relation to 0 -- due to the 
         * nature of double precision and floating point operations,
         * simply checking if a value x is greater than 0 does not
         * mean it is positive. Instead, the epsilon is used
         * to represent  the smallest possible positive value. */
        public static final Double EPSILON = 0.000000000001;

        /* The unit value within a scene. For Forces, this is the 
         * maximum absolute value any of its x, y, or z portions
         * may be. In other words, all values must be between
         * -1.0 and 1.0 (within an epsilon value, that is) */
        public static final Double UNIT = 1.0;

        /**
         * @author jakemingolla
         *
         * Gets the absolute value of a given double precision value.
         * For example, if the value is negative it will return the positive
         * value.
         *
         * @param a     Value to get the absolute value of it.
         * @return      The absolute value.
         */
        public static Double abs(Double a) {
                if (a > EPSILON) {
                        return a;
                } else if (a < EPSILON) {
                        return -1 * a;
                } else {
                        return 0.0;
                }
        }

        /**
         * @author jakemingolla
         *
         * Returns whether the two given double precision values are
         * within {@link EPSILON} of eachother.
         *
         * @param a     First value to check if it is in range of the second.
         * @param b     Second value to check if it is in range of the first.
         * @return      The Boolean value of whether or not a and b are within
         *              EPSILON of eachother.
         */
        public static Boolean inRange(Double a, Double b) {
                return abs(a - b) < EPSILON;
        }

        /**
         * @author jakemingolla
         *
         * Returns the enumerated {@link UNIT} value whether or not
         * the argument is positive or negative. Uses {@link EPSILON}
         * to determine the sign.
         *
         * @param a     The double precision value to check the sign of.
         * @return      The signed {@link UNIT} value.
         */
        public static Double getSign(Double a) {
                if (inRange(a, 0.0)) {
                        return UNIT;
                } else if (a > EPSILON) {
                        return UNIT;
                } else {
                        return -1 * UNIT;
                }
        }

        /**
         * @author jakemingolla
         *
         * Bounds a given value close to {@link EPSILON}. If the
         * absolute value of the value is within -1 * EPSILON and
         * EPSILON, it will be rounded to EPSILON. Otherwise it
         * remains unchanged.
         *
         * @param val   The double precision value to get the 
         *              bounded value of.
         * @return      The bounded value.
         */
        public static Double bound(Double val) {
                if (inRange(val, EPSILON)) {
                        return EPSILON;
                } else {
                        return val;
                }
        }

        public static Boolean inUnit(Double a) {
                Double val = abs(a);
                return (val < UNIT) || (inRange(val, UNIT));
        }
                
}
