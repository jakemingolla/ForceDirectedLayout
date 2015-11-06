import java.util.List;

public class ForceDirectedGraph<Atom, Spring> extends Graph {

        List<FirstOrderApplicator> firstOrderApplicatorList;
        List<SecondOrderApplicator> secondOrderApplicatorList;

        ForceDirectedGraph(List<Atom> vertexList, List<Spring> edgeList,
                           List<FirstOrderApplicator> firstOrderApplicatorList,
                           List<SecondOrderApplicator> secondOrderApplicatorList) {
                super(vertexList, edgeList);
                this.firstOrderApplicatorList = firstOrderApplicatorList;
                this.secondOrderApplicatorList = secondOrderApplicatorList;
        }

        public void update() {
                Integer nodeListLength = vertexList.size();
                Integer edgeListLength = edgeList.size();

                for (SecondOrderApplicator soa : secondOrderApplicatorList) {
                        if (soa.getAppliedClass().getSuperclass().equals(Node.class)) {
                                for (int i = 0; i < nodeListLength; i++) {
                                        for (int j = 0; j < nodeListLength; j++) {
                                                if (i != j) {
                                                        Node a = (Node)vertexList.get(i);
                                                        Node b = (Node)vertexList.get(j);
                                                        Class c = soa.getAppliedClass();
                                                        if (soa.getAppliedClass().equals(a.getClass()) &&
                                                            soa.getAppliedClass().equals(b.getClass())) {
                                                                soa.apply(a, b);
                                                        }
                                                        
                                                }
                                        }
                                }
                        }
                }

                super.update();
        }

}
