import 'package:assignment3/models/dependency_graph_node.dart';

class DeleteNode {
  static void deleteNode(DependencyGraphNode nodeToBeDeleted) {
    for (int i = 0; i < nodeToBeDeleted.parents.length; i++) {
      DependencyGraphNode parent = nodeToBeDeleted.parents[i];
      parent.deleteChild(nodeToBeDeleted);
      nodeToBeDeleted.deleteParent(parent);
    }
    for (int i = 0; i < nodeToBeDeleted.children.length; i++) {
      DependencyGraphNode child = nodeToBeDeleted.children[i];
      nodeToBeDeleted.deleteChild(child);
      child.deleteParent(nodeToBeDeleted);
    }
  }
}
