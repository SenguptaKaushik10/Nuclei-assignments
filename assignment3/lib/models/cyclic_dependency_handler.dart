import 'package:assignment3/models/dependency_graph_node.dart';
import 'package:assignment3/strings/strings_for_output.dart';

class CyclicDependencyHandler {
  static int flagToCheckIfCyclicDependencyExists = 0;
  static int checkIfCyclicDependencyExists(DependencyGraphNode node) {
    node.flagToCheckIfNodeAlreadyVisited = 1;
    for (int i = 0; i < node.children.length; i++) {
      DependencyGraphNode newNode = node.children[i];
      if (newNode.flagToCheckIfNodeAlreadyVisited == 1) {
        print(StringsForOutput.CYCLIC_DEPENDENCY_EXISTS_MESSAGE_STRING);
        flagToCheckIfCyclicDependencyExists = 1;
        return 1;
      }
      checkIfCyclicDependencyExists(newNode);
    }
    return 0;
  }
}
