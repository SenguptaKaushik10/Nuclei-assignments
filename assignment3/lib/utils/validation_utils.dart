import 'dart:ffi';

import 'package:assignment3/exceptions/exception_handling.dart';
import 'package:assignment3/models/dependency_graph_node.dart';

class ValidationUtils {
  static void checkIfNodeHasParents(int numberOfParents) {
    if (numberOfParents < 1) {
      throw NoParentOfThisNodeWhileDisplayingParentsException();
    }
  }

  static void checkIfNodeHasChildren(int numberOfChildren) {
    if (numberOfChildren < 1) {
      throw NoChildrenOfThisNodeWhileDisplayingChildrenException();
    }
  }

  static void checkIfNodeIDIsUnique(
      List<DependencyGraphNode> listOfNodes, int newNodeID) {
    listOfNodes.forEach((node) {
      if (node.nodeID == newNodeID) {
        throw NotUniqueNodeIDException();
      }
    });
  }

  static void checkIfNodeHasDescendents(int lenOfChildren) {
    if (lenOfChildren < 1) {
      throw NoDescendentOfThisNodeWhileDisplayingDescendentsException();
    }
  }

  static void checkIfNodeHasAncestors(int lenOfParents) {
    if (lenOfParents < 1) {
      throw NoAncestorOfThisNodeWhileDisplayingDescendentsException();
    }
  }
}
