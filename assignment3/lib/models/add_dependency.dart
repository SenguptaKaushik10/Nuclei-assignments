import 'package:assignment3/models/cyclic_dependency_handler.dart';
import 'package:assignment3/models/dependency_graph_node.dart';

class AddDependency {
  static int addDependency(
      DependencyGraphNode parent, DependencyGraphNode child) {
    parent.addChild(child);
    child.addParent(parent);
    CyclicDependencyHandler.checkIfCyclicDependencyExists(parent);
    return CyclicDependencyHandler.flagToCheckIfCyclicDependencyExists;
  }
}
