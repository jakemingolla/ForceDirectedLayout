public class Utilities {

        public static final Float EPSILON = 0.000000000001f;
        public static final Float UNIT = 1f;

        public static Float abs(Float a) {
                if (a > EPSILON) {
                        return a;
                } else if (a < EPSILON) {
                        return -1 * a;
                } else {
                        return 0f;
                }
        }

        public static Boolean inRange(Float a, Float b) {
                return abs(a - b) < EPSILON;
        }

        public static Boolean inUnit(Float a) {
                Float val = abs(a);
                return (val < UNIT) || (inRange(val, UNIT));
        }
                
}
