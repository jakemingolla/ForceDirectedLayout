import java.util.List;
import java.util.ArrayList;
import static java.lang.Math.sqrt;

/**
 * @author jakemingolla
 * @since 1.0
 *
 * Abstract class to hold the information relating to a Node in the 
 * scene. A Node is defined as any object meeting the following criteria:
 *      - Defined in three dimensional Cartesian space (x, y, z)
 *      - Maintains a three dimensional velocity (vX, vY, vZ)
 *      - Has a three dimensonal shape (w, l, h)
 *      - Has a color in RGB space (r, g, b, a)
 *      - A weight
 *      - A list of forces acting on the object.
 *
 * @see Force
 */
public abstract class Node implements Updateable {

        /* Three dimensional Cartesian coordinates */
        protected Double x;
        protected Double y;
        protected Double z;

        /* Three dimensional shape dimensions */
        protected Double w;
        protected Double h;
        protected Double l;

        /* RGB for coloring. */
        protected Double r;
        protected Double b;
        protected Double g;
        protected Double a;

        /* Three dimensional velocities for updating. */
        protected Double vX;
        protected Double vY;
        protected Double vZ;

        /* Weight for interacting with other objects in the space. */
        protected Double weight;

        /* List of forces acting on the object. */
        List<Force> forces;

        /**
         * @author jakemingolla
         *
         * Default constructor for creating an instance of the Node object with
         * the given parameters.
         *
         * @param weight        The weight of the Node in the space.
         * @param x             The x position of the Node.
         * @param y             The y position of the Node.
         * @param z             The z position of the Node.
         * @param w             The width of the Node (how fart it extends in the Y direction).
         * @param h             The height of the Node (how far it extends in the Y direction).
         * @param l             The length of the Node (how far it extends in the Z direction).
         * @param r             The red value of the Node's color.
         * @param g             The green value of the Node's color.
         * @param b             The blue value of the Node's color.
         * @param a             The alpha value of the Node's color.
         */
        Node(Double weight,
             Double x, Double y, Double z,
             Double w, Double h, Double l,
             Double r, Double g, Double b, Double a) {
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

                /* The forces list starts empty. */
                this.forces = new ArrayList<Force>();

                /* All velocities are initially set to zero. */
                this.vX = 0.0;
                this.vY = 0.0;
                this.vZ = 0.0;
        }

        /**
         * @author jakemingolla
         *
         * Updates a Node object in the scene. Every time update is called,
         * a force of friction is applied to the Node that opposes its current velocity
         * in all directions. Then, its acceleration is adjusted based on the sum of
         * all forces acting on the Node, which in turn affects its velocity.
         *
         * Use {@link Constants#DEFAULT_FRICTION_FACTOR} to change the rate at which
         * friction is applied.
         *
         * @see Force
         * */
        public void update() {
                if (forces.size() > 0) {
                        Double magnitude = sqrt((vX * vX) + (vY * vY) + (vZ * vZ));

                        if (magnitude > Utilities.EPSILON) {
                                Force friction = new Force()
                                                        .withX((-1.0d * vX) / magnitude)
                                                        .withY((-1.0d * vY) / magnitude)
                                                        .withZ((-1.0d * vZ) / magnitude)
                                                        .withMagnitude(magnitude * Constants.DEFAULT_FRICTION_FACTOR);
                                addForce(friction);
                        }

                        /* These hold the sum of each force's magnitude
                         * in the given direction. */
                        Double xTotal = 0.0d;
                        Double yTotal = 0.0d;
                        Double zTotal = 0.0d;
                        

                        /* Sum up the magnitude and direction of all
                         * the Forces in the Force list. */
                        for (Force f : forces) {
                                magnitude = f.getMagnitude();
                                xTotal += f.getX() * magnitude;
                                yTotal += f.getY() * magnitude;
                                zTotal += f.getZ() * magnitude;
                        }

                        /* The acceleration is proportional the weight
                         * of the object (f = ma). */
                        Double xAcceleration = (xTotal / weight);
                        Double yAcceleration = (yTotal / weight);
                        Double zAcceleration = (zTotal / weight);

                        /* Finally, update the current velocity of the Node... */
                        vX += xAcceleration;
                        vY += yAcceleration;
                        vZ += zAcceleration;

                        System.out.println("x velocity = " + vX);
                        System.out.println("y velocity = " + vY);
                        System.out.println("z velocity = " + vZ);
                        System.out.println("-----------------");

                        /* ... which in turn updates the current Cartesian coordinates
                         * for positoion. */
                        x += vX;
                        y += vY;
                        z += vZ;

                        /* We must clear the force list in order to prevent the forces
                         * from being applied multiple times. */
                        clearForces();
                }
        }

        /**
         * @author jakemingolla
         *
         * Returns the kinetic energy of the given Node. In a system with friction,
         * this will decrease over time.
         *
         * @return Double       The kinetic energy of the Node.
         */
        public Double getKineticEnergy() {
                return 0.5 * weight * Math.sqrt((vX * vX) + (vY * vY) + (vZ * vZ));
        }

        /**
         * @author jakemingolla
         *
         * Adds a given force to the force list.
         *
         * @param f     The {@link Force} to be added.
         */
        public void addForce(Force f) {
                forces.add(f);
        }

        /**
         * @author jakemingolla
         *
         * Clears the current list of forces, reseting it back to empty.
         */
        public void clearForces() {
                forces.clear();
        } 

        /**
         * @author jakemingolla
         *
         * Find the distance in the x direction between
         * the current Node and the target Node.
         *
         * @param target        The Node to get the distance to.
         * @return Double       The distance to the target Node. Takes
         *                      into account the sign of the x positions.
         */
        public Double getXDiff(Node target) {
                return x - target.getX();
        }

        /**
         * @author jakemingolla
         *
         * Find the distance in the y direction between
         * the current Node and the target Node.
         *
         * @param target        The Node to get the distance to.
         * @return Double       The distance to the target Node. Takes
         *                      into account the sign of the y positions.
         */
        public Double getYDiff(Node target) {
                return y - target.getY();
        }
 
        /**
         * @author jakemingolla
         *
         * Find the distance in the z direction between
         * the current Node and the target Node.
         *
         * @param target        The Node to get the distance to.
         * @return Double       The distance to the target Node. Takes
         *                      into account the sign of the z positions.
         */
        public Double getZDiff(Node target) {
                return z - target.getZ();
        }

        /**
         * @author jakemingolla
         *
         * Finds the distance to a target Node. Gets the absolute value of all
         * of the differences for each direction in the 3-Dimensional
         * Cartesian space.
         *
         * @param target        The Node to get the distance to.
         * @return Double       The absolute value of the distance to the target Node.
         */
        public Double getDistance(Node target) {
                Double xDiff = getXDiff(target);
                Double yDiff = getYDiff(target);
                Double zDiff = getZDiff(target);
                return Math.sqrt((xDiff * xDiff) + (yDiff * yDiff) + (zDiff * zDiff));
        }

        /** 
         * @author jakemingolla
         *
         * Returns whether or not the target Node intersects with (inclusively with the
         * boundary) to the current Node in the x direction. May be overriden for irregular shapes.
         *
         * @param target        The target Node to test for intersection
         */
        public Boolean canIntersectX(Node target) {
                Double targetX = target.getX();
                Double targetW = target.getW();
                Double targetRightEnd = targetX - (targetW / 2);

                Double leftEnd = x - (w / 2);
                Double rightEnd = x + (w / 2);
                Boolean intersect = ((targetRightEnd > leftEnd && targetRightEnd < rightEnd) ||
                                     (Utilities.inRange(targetRightEnd, rightEnd) || Utilities.inRange(targetRightEnd, leftEnd)));

                return intersect;
        }

        /** 
         * @author jakemingolla
         *
         * Returns whether or not the target Node intersects with (inclusively with the
         * boundary) to the current Node in the y direction. May be overriden for irregular shapes.
         *
         * @param target        The target Node to test for intersection
         */
        public Boolean canIntersectY(Node target) {
                Double targetY = target.getY();
                Double targetH = target.getH();
                Double targetRightEnd = targetY - (targetH / 2);

                Double leftEnd = y - (h / 2);
                Double rightEnd = y + (h / 2);

                Boolean intersect = ((targetRightEnd > leftEnd && targetRightEnd < rightEnd) ||
                                     (Utilities.inRange(targetRightEnd, rightEnd) || Utilities.inRange(targetRightEnd, leftEnd)));

                return intersect;
        }

        /** 
         * @author jakemingolla
         *
         * Returns whether or not the target Node intersects with (inclusively with the
         * boundary) to the current Node in the z direction. May be overriden for irregular shapes.
         *
         * @param target        The target Node to test for intersection
         */
        public Boolean canIntersectZ(Node target) {
                Double targetZ = target.getZ();
                Double targetL = target.getL();
                Double targetRightEnd = targetZ - (targetL / 2);

                Double leftEnd = z - (l / 2);
                Double rightEnd = z + (l / 2);

                Boolean intersect = ((targetRightEnd > leftEnd && targetRightEnd < rightEnd) ||
                                     (Utilities.inRange(targetRightEnd, rightEnd) || Utilities.inRange(targetRightEnd, leftEnd)));

                return intersect;
        }

        /**
         * @author jakemingolla
         *
         * returns whether or not the target Node intersects with (inclusively with the
         * boundary) to the current Node in all directions.
         *
         * @param target        The target Node to test for intersection
         */
        public Boolean canIntersect(Node target) {
                return canIntersectX(target) && canIntersectY(target) && canIntersectZ(target);
        }

        /*
         *
         *      "Getters" and "Setters" for each field are below.
         *
         */

        public void setWeight(Double weight) {
                this.weight = weight;
        }
        public void setX(Double x) {
                this.x = x;
        }
        public void setY(Double y) {
                this.y = y;
        }
        public void setZ(Double z) {
                this.z = z;
        }
        public void setW(Double w) {
                this.w = w;
        }
        public void setH(Double l) {
                this.h = h;
        }
        public void setL(Double l) {
                this.l = l;
        }
        public void setR(Double r) {
                this.r = r;
        }
        public void setG(Double g) {
                this.g = g;
        }
        public void setB(Double b) {
                this.b = b;
        }
        public void setA(Double a) {
                this.a = a;
        }
        public void setVX(Double vX) {
                this.vX = vX;
        }
        public void setVY(Double vY) {
                this.vY = vY;
        }
        public void setVZ(Double vZ) {
                this.vZ = vZ;
        }

        public Double getWeight() {
                return weight;
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
        public Double getW() {
                return w;
        }
        public Double getH() {
                return h;
        }
        public Double getL() {
                return l;
        }
        public Double getR() {
                return r;
        }
        public Double getG() {
                return g;
        }
        public Double getB() {
                return b;
        }
        public Double getA() {
                return a;
        }
        public Double getVX() {
                return vX;
        }
        public Double getVY() {
                return vY;
        }
        public Double getVZ() {
                return vZ;
        }
}

