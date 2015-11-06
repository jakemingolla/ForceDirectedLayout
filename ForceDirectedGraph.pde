import java.util.List;

public class ForceDirectedGraph<Atom, Spring> extends Graph {

        List<Applicator> applicatorList;
        ForceDirectedGraph(List<Atom> vertexList, List<Spring> edgeList,
                           List<Applicator> applicatorList) {
                super(vertexList, edgeList);
                this.applicatorList = applicatorList;
        }

        public void update() {
                Integer nodeListLength = vertexList.size();
                Integer edgeListLength = edgeList.size();

                for (Applicator app : applicatorList) {
                        Class c = app.getAppliedClass();
                        if (app.getAppliedClass().getSuperclass().equals(Node.class)) {
                                for (int i = 0; i < nodeListLength; i++) {
                                        Node a = (Node)vertexList.get(i);
                                        if (app instanceof SecondOrderApplicator) {
                                                for (int j = i + 1; j < nodeListLength; j++) {
                                                        if (i != j) {
                                                                Node b = (Node)vertexList.get(j);
                                                                if (c.equals(a.getClass()) &&
                                                                    c.equals(b.getClass())) {
                                                                        app.apply(a, b);
                                                                } 
                                                        }
                                                }
                                        } else {
                                                if (c.equals(a.getClass())) {
                                                        app.apply(a);
                                                }
                                        }
                                }
                        }
                }
                super.update();
        }

        public Double getKineticEnergy() {
                Double sum = 0.0d;
                Integer nodeListLength = vertexList.size();
                for (int i = 0; i < nodeListLength; i++) {
                        Node node = (Node)vertexList.get(i);
                        sum += node.getKineticEnergy();
                }
                return sum;
        }

}
