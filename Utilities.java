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

        public static Double getSign(Double a) {
                if (inRange(a, 0.0)) {
                        return 0.0d;
                } else if (a > EPSILON) {
                        return 1.0d;
                } else {
                        return -1.0d;
                }
        }

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
