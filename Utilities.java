public class Utilities {

        public static final Double EPSILON = 0.000000000001;
        public static final Double UNIT = 1.0;

        public static Double abs(Double a) {
                if (a > EPSILON) {
                        return a;
                } else if (a < EPSILON) {
                        return -1 * a;
                } else {
                        return 0.0;
                }
        }

        public static Boolean inRange(Double a, Double b) {
                return abs(a - b) < EPSILON;
        }

        public static Boolean inUnit(Double a) {
                Double val = abs(a);
                return (val < UNIT) || (inRange(val, UNIT));
        }
                
}
