import 'package:assignment3/exceptions/exception_handling.dart';
import 'package:assignment3/models/dependency_graph_node.dart';
import 'package:assignment3/strings/strings_for_exception.dart';
import 'package:assignment3/strings/strings_for_output.dart';
import 'package:assignment3/utils/validation_utils.dart';

class DisplayImmediateChildren {
  static void displayImmediateChildrenOfNode(DependencyGraphNode node) {
    int numberOfChildren = node.children.length;
    try {
      ValidationUtils.checkIfNodeHasChildren(numberOfChildren);
    } on NoChildrenOfThisNodeWhileDisplayingChildrenException {
      print(StringsForException.NO_CHILDREN_OF_THIS_NODE_EXCEPTION_STRING);
    } on FormatException {
      print(StringsForException.FORMAT_EXCEPTION_STRING);
    }
    for (int i = 0; i < numberOfChildren; i++) {
      print('${StringsForOutput.CHILDREN_STRING} ${i + 1}: ');
      print('${StringsForOutput.NODE_ID_STRING} ${node.children[i].nodeID}');
      print(
          '${StringsForOutput.NODE_NAME_STRING} ${node.children[i].nodeName}');
      print('\n');
    }
  }
}
