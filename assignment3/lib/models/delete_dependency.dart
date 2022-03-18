import 'dart:io';
import 'package:assignment3/models/dependency_graph_node.dart';
import 'package:assignment3/strings/strings_for_input.dart';
import 'package:assignment3/strings/strings_for_menu.dart';
import 'package:assignment3/strings/strings_for_output.dart';

class DeleteDependency {
  static void deleteDependency(DependencyGraphNode deleteDependencyNode) {
    const int SWITCH_CASE_OPTION_ONE = 1;
    const int SWITCH_CASE_OPTION_TWO = 2;
    const int TRUE = 1;
    const int FALSE = 0;
    print(StringsForMenu.SELECT_OPTION_STRING);
    print(StringsForMenu.DELETE_PARENT_OPTION_STRING);
    print(StringsForMenu.DELETE_CHILD_OPTION_STRING);
    int switchCaseSelectOption = int.parse(stdin.readLineSync()!);
    switch (switchCaseSelectOption) {
      case SWITCH_CASE_OPTION_ONE:
        print(StringsForInput.ENTER_PARENT_NODEID_TO_BE_DELETED);
        int parentNodeID = int.parse(stdin.readLineSync()!);
        int flagToCheckIfParentNodeExists = FALSE;
        int? lenOfParentsList = deleteDependencyNode.parents.length;
        for (int i = 0; i < lenOfParentsList; i++) {
          if (deleteDependencyNode.parents[i].nodeID == parentNodeID) {
            DependencyGraphNode nodeToBeDeleted =
                deleteDependencyNode.parents[i];
            flagToCheckIfParentNodeExists = TRUE;
            deleteDependencyNode.deleteParent(nodeToBeDeleted);
            nodeToBeDeleted.deleteChild(deleteDependencyNode);
            print(StringsForOutput.DEPENDENCY_DELETED_SUCCESSFULLY_STRING);
          }
        }
        if (flagToCheckIfParentNodeExists == FALSE) {
          print(StringsForOutput.PARENT_NODE_DOESNOT_EXIST_MESSAGE_STRING);
        }
        break;
      case SWITCH_CASE_OPTION_TWO:
        print(StringsForInput.ENTER_CHILD_NODEID_TO_BE_DELETED);
        int childNodeID = int.parse(stdin.readLineSync()!);
        int flagToCheckIfChildNodeExists = FALSE;
        int? lenOfChildrenList = deleteDependencyNode.children.length;
        for (int i = 0; i < lenOfChildrenList; i++) {
          if (deleteDependencyNode.children[i].nodeID == childNodeID) {
            DependencyGraphNode nodeToBeDeleted =
                deleteDependencyNode.children[i];
            flagToCheckIfChildNodeExists = TRUE;
            deleteDependencyNode.deleteChild(nodeToBeDeleted);
            nodeToBeDeleted.deleteParent(deleteDependencyNode);
            print(StringsForOutput.DEPENDENCY_DELETED_SUCCESSFULLY_STRING);
          }
        }
        if (flagToCheckIfChildNodeExists == FALSE) {
          print(StringsForOutput.CHILD_NODE_DOESNOT_EXIST_MESSAGE_STRING);
        }
        break;
      default:
        print(StringsForOutput.DEFAULT_MESSAGE_STRING);
        break;
    }
  }
}
