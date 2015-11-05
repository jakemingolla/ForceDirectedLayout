import java.util.List;

public class ForceDirectedGraph<Atom, Spring> extends Graph {

        List<NodeForceApplicator> nodeForceApplicatorList;
        List<EdgeForceApplicator> edgeForceApplicatorList;

        ForceDirectedGraph(List<Atom> vertexList, List<Spring> edgeList,
                           List<NodeForceApplicator> nodeForceApplicatorList,
                           List<EdgeForceApplicator> edgeForceApplicatorList) {
                super(vertexList, edgeList);
                this.nodeForceApplicatorList = nodeForceApplicatorList;
                this.edgeForceApplicatorList = edgeForceApplicatorList;
        }

        public void update() {
                Integer nodeListLength = vertexList.size();
                Integer edgeListLength = edgeList.size();

                for (NodeForceApplicator nfa : nodeForceApplicatorList) {
                        for (int i = 0; i < nodeListLength; i++) {
                                for (int j = 0; j < nodeListLength; j++) {
                                        if (i != j) {
                                                Node first = (Node)vertexList.get(i);
                                                Node second = (Node)vertexList.get(j);
                                                nfa.apply(first, second);
                                        }
                                }
                        }
                }
                super.update();
        }

}
