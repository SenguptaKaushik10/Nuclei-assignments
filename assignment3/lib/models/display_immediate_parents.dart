import 'package:assignment3/exceptions/exception_handling.dart';
import 'package:assignment3/models/dependency_graph_node.dart';
import 'package:assignment3/strings/strings_for_exception.dart';
import 'package:assignment3/strings/strings_for_output.dart';
import 'package:assignment3/utils/validation_utils.dart';

class DisplayImmediateParents {
  static void displayImmediateParentsOfNode(DependencyGraphNode node) {
    int lenOfParents = node.parents.length;
    try {
      ValidationUtils.checkIfNodeHasParents(lenOfParents);
    } on NoParentOfThisNodeWhileDisplayingParentsException {
      print(StringsForException.NO_PARENT_OF_THIS_NODE_EXCEPTION_STRING);
    } on FormatException {
      print(StringsForException.FORMAT_EXCEPTION_STRING);
    }
    for (int i = 0; i < lenOfParents; i++) {
      print('${StringsForOutput.PARENT_STRING} ${i + 1}: ');
      print('${StringsForOutput.NODE_ID_STRING} ${node.parents[i].nodeID}');
      print('${StringsForOutput.NODE_NAME_STRING} ${node.parents[i].nodeName}');
      print('\n');
    }
  }
}
