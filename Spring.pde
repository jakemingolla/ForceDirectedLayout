public class Spring<Atom> extends Edge implements Renderable {
        Spring(Atom vertex1, Atom vertex2) {
                super(vertex1, vertex2);
        }

        public void render() {
                pushMatrix();
                       stroke(Constants.DEFAULT_SPRING_R,
                              Constants.DEFAULT_SPRING_G,
                              Constants.DEFAULT_SPRING_B,
                              Constants.DEFAULT_SPRING_A);
                       strokeWeight(Constants.DEFAULT_SPRING_STROKE_WEIGHT); 
                       line(((Node)vertex1).getX(), ((Node)vertex1).getY(), ((Node)vertex1).getZ(),
                            ((Node)vertex2).getX(), ((Node)vertex2).getY(), ((Node)vertex2).getZ());
               popMatrix();
        }
}
