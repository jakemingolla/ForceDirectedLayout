public class Spring<Atom> extends Edge implements Renderable {
        Spring(Atom vertex1, Atom vertex2) {
                super(vertex1, vertex2);
        }

        public void render() {
                pushMatrix();
                       stroke(Constants.DEFAULT_SPRING_R.floatValue(),
                              Constants.DEFAULT_SPRING_G.floatValue(),
                              Constants.DEFAULT_SPRING_B.floatValue(),
                              Constants.DEFAULT_SPRING_A.floatValue());
                       strokeWeight(Constants.DEFAULT_SPRING_STROKE_WEIGHT.floatValue()); 
                       line(((Node)vertex1).getX().floatValue(), ((Node)vertex1).getY().floatValue(), ((Node)vertex1).getZ().floatValue(),
                            ((Node)vertex2).getX().floatValue(), ((Node)vertex2).getY().floatValue(), ((Node)vertex2).getZ().floatValue());
               popMatrix();
        }
}
