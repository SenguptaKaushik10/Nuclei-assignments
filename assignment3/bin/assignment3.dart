import 'dart:io';
import 'package:assignment3/exceptions/exception_handling.dart';
import 'package:assignment3/models/add_dependency.dart';
import 'package:assignment3/models/cyclic_dependency_handler.dart';
import 'package:assignment3/models/delete_dependency.dart';
import 'package:assignment3/models/delete_node.dart';
import 'package:assignment3/models/dependency_graph_node.dart';
import 'package:assignment3/models/display_immediate_children.dart';
import 'package:assignment3/models/display_immediate_parents.dart';
import 'package:assignment3/strings/strings_for_exception.dart';
import 'package:assignment3/strings/strings_for_input.dart';
import 'package:assignment3/strings/strings_for_menu.dart';
import 'package:assignment3/strings/strings_for_output.dart';
import 'package:assignment3/utils/validation_utils.dart';

void main() {
  List<DependencyGraphNode> listOfNodes = [];
  const String DEFAULT_NODE_NAME = 'defaultNode';
  const int DEFAULT_NODE_ID = 00;
  const int FALSE = 0;
  const int TRUE = 1;
  const int OUTER_SWITCH_CASE_OPTION_ONE = 1;
  const int OUTER_SWITCH_CASE_OPTION_TWO = 2;
  const int OUTER_SWITCH_CASE_OPTION_THREE = 3;
  const int OUTER_SWITCH_CASE_OPTION_FOUR = 4;
  const int OUTER_SWITCH_CASE_OPTION_FIVE = 5;
  const int OUTER_SWITCH_CASE_OPTION_SIX = 6;
  const int OUTER_SWITCH_CASE_OPTION_SEVEN = 7;
  const int OUTER_SWITCH_CASE_OPTION_EIGHT = 8;
  const int OUTER_SWITCH_CASE_OPTION_NINE = 9;
  OuterWhileLoop:
  while (true) {
    print(StringsForMenu.SELECT_OPTION_STRING);
    print(StringsForMenu.GET_IMMEDIATE_PARENT_OPTION_STRING);
    print(StringsForMenu.GET_IMMEDIATE_CHILDREN_OPTION_STRING);
    print(StringsForMenu.GET_ANCESTORS_OPTION_STRING);
    print(StringsForMenu.GET_DESCENDENTS_OPTION_STRING);
    print(StringsForMenu.DELETE_DEPENDENCY_OPTION_STRING);
    print(StringsForMenu.DELETE_NODE_OPTION_STRING);
    print(StringsForMenu.ADD_DEPENDENCY_OPTION_STRING);
    print(StringsForMenu.ADD_NODE_OPTION_STRING);
    print(StringsForMenu.EXIT_OPTION_STRING);
    int inputOption = int.parse(stdin.readLineSync()!);
    InnerSwitchCase:
    switch (inputOption) {
      case OUTER_SWITCH_CASE_OPTION_ONE:
        print(StringsForInput.ENTER_NODEID_TO_GET_PARENTS);
        int thisNodeID = DEFAULT_NODE_ID;
        try {
          thisNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        DependencyGraphNode thisNode =
            DependencyGraphNode(thisNodeID, DEFAULT_NODE_NAME);
        int flagToCheckIfNewNodeExists = FALSE;
        listOfNodes.forEach((node) {
          if (node.nodeID == thisNodeID) {
            thisNode = node;
            flagToCheckIfNewNodeExists = TRUE;
          }
        });
        if (flagToCheckIfNewNodeExists == FALSE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        } else {
          DisplayImmediateParents.displayImmediateParentsOfNode(thisNode);
        }
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_TWO:
        print(StringsForInput.ENTER_NODEID_TO_GET_CHILDREN);
        int thisNodeID = DEFAULT_NODE_ID;
        try {
          thisNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        DependencyGraphNode thisNode =
            DependencyGraphNode(thisNodeID, DEFAULT_NODE_NAME);
        int flagToCheckIfNewNodeExists = FALSE;
        listOfNodes.forEach((node) {
          if (node.nodeID == thisNodeID) {
            thisNode = node;
            flagToCheckIfNewNodeExists = TRUE;
          }
        });
        if (flagToCheckIfNewNodeExists == FALSE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        } else {
          DisplayImmediateChildren.displayImmediateChildrenOfNode(thisNode);
        }
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_THREE:
        print(StringsForInput.ENTER_NODEID_TO_GET_ANCESTORS);
        int thisNodeID = DEFAULT_NODE_ID;
        try {
          thisNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        int flagToCheckIfThisNodeExists = FALSE;
        DependencyGraphNode thisNode =
            DependencyGraphNode(thisNodeID, DEFAULT_NODE_NAME);
        listOfNodes.forEach((node) {
          if (node.nodeID == thisNodeID) {
            flagToCheckIfThisNodeExists = TRUE;
            thisNode = node;
          }
        });
        if (flagToCheckIfThisNodeExists == FALSE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        } else {
          try {
            ValidationUtils.checkIfNodeHasAncestors(thisNode.parents.length);
          } on NoAncestorOfThisNodeWhileDisplayingDescendentsException {
            print(
                StringsForException.NO_ANCESTOR_OF_THIS_NODE_EXCEPTION_STRING);
          }
          thisNode.displayAncestors(thisNode);
        }
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_FOUR:
        print(StringsForInput.ENTER_NODEID_TO_GET_DESCENDENTS);
        int thisNodeID = DEFAULT_NODE_ID;
        try {
          thisNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        int flagToCheckIfThisNodeExists = FALSE;
        DependencyGraphNode thisNode =
            DependencyGraphNode(thisNodeID, DEFAULT_NODE_NAME);
        listOfNodes.forEach((node) {
          if (node.nodeID == thisNodeID) {
            flagToCheckIfThisNodeExists = TRUE;
            thisNode = node;
          }
        });
        if (flagToCheckIfThisNodeExists == FALSE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        } else {
          try {
            ValidationUtils.checkIfNodeHasDescendents(thisNode.children.length);
          } on NoDescendentOfThisNodeWhileDisplayingDescendentsException {
            print(StringsForException
                .NO_DESCENDENT_OF_THIS_NODE_EXCEPTION_STRING);
          }
          thisNode.displayDescendants(thisNode);
        }
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_FIVE:
        print(StringsForInput.ENTER_NODEID_TO_DELETE_DEPENDENT);
        int deleteDependencyNodeID = DEFAULT_NODE_ID;
        try {
          deleteDependencyNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        int flagToCheckIfThisNodeExists = FALSE;
        DependencyGraphNode deleteDependencyNode =
            DependencyGraphNode(deleteDependencyNodeID, DEFAULT_NODE_NAME);
        listOfNodes.forEach((node) {
          if (node.nodeID == deleteDependencyNodeID) {
            deleteDependencyNode = node;
            flagToCheckIfThisNodeExists = TRUE;
          }
        });
        if (flagToCheckIfThisNodeExists == TRUE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        } else {
          DeleteDependency.deleteDependency(deleteDependencyNode);
        }
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_SIX:
        print(StringsForInput.ENTER_NODEID_TO_DELETE_NODE);
        int nodeToBeDeletedNodeID = DEFAULT_NODE_ID;
        try {
          nodeToBeDeletedNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        DependencyGraphNode nodeToBeDeleted =
            DependencyGraphNode(nodeToBeDeletedNodeID, DEFAULT_NODE_NAME);
        int flagToCheckIfNodeExists = FALSE;
        listOfNodes.forEach((node) {
          if (node.nodeID == nodeToBeDeletedNodeID) {
            nodeToBeDeleted = node;
            flagToCheckIfNodeExists = TRUE;
          }
        });
        if (flagToCheckIfNodeExists == FALSE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        } else {
          DeleteNode.deleteNode(nodeToBeDeleted);
          listOfNodes.remove(nodeToBeDeleted);
          print(StringsForOutput.NODE_DELETED_SUCCESSFULLY_STRING);
        }
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_SEVEN:
        print(StringsForInput.ENTER_PARENT_NODEID);
        int parentNodeID = DEFAULT_NODE_ID;
        try {
          parentNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        DependencyGraphNode thisParentNode =
            DependencyGraphNode(parentNodeID, DEFAULT_NODE_NAME);
        // check if the node exists;
        int flagToCheckIfParentNodeExists = FALSE;
        listOfNodes.forEach((node) {
          if (node.nodeID == parentNodeID) {
            thisParentNode = node;
            flagToCheckIfParentNodeExists = TRUE;
          }
        });
        if (flagToCheckIfParentNodeExists == FALSE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        }
        print(StringsForInput.ENTER_CHILD_NODEID);
        int childNodeID = DEFAULT_NODE_ID;
        try {
          childNodeID = int.parse(stdin.readLineSync()!);
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        DependencyGraphNode thisChildNode =
            DependencyGraphNode(childNodeID, DEFAULT_NODE_NAME);
        int flagToCheckIfChildNodeExists = FALSE;
        listOfNodes.forEach((node) {
          if (node.nodeID == childNodeID) {
            thisChildNode = node;
            flagToCheckIfChildNodeExists = TRUE;
          }
        });
        if (flagToCheckIfChildNodeExists == FALSE) {
          print(StringsForOutput.NODE_DOESNOT_EXIST_MESSAGE_STRING);
          break InnerSwitchCase;
        } else {
          AddDependency.addDependency(thisParentNode, thisChildNode);
          listOfNodes.forEach((node) {
            node.flagToCheckIfNodeAlreadyVisited = FALSE;
          });
          if (CyclicDependencyHandler.flagToCheckIfCyclicDependencyExists ==
              1) {
            thisParentNode.deleteChild(thisChildNode);
            thisChildNode.deleteParent(thisParentNode);
            CyclicDependencyHandler.flagToCheckIfCyclicDependencyExists = 0;
            break InnerSwitchCase;
          }
        }
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_EIGHT:
        print(StringsForInput.ENTER_NODEID);
        int nodeId = DEFAULT_NODE_ID;
        try {
          nodeId = int.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfNodeIDIsUnique(listOfNodes, nodeId);
        } on NotUniqueNodeIDException {
          print(StringsForException.NOT_UNIQUE_NODEID_EXCEPTION_STRING);
          break InnerSwitchCase;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        print(StringsForInput.ENTER_NODE_NAME);
        String nodeName = DEFAULT_NODE_NAME;
        try {
          nodeName = stdin.readLineSync()!;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break InnerSwitchCase;
        }
        DependencyGraphNode node1 = DependencyGraphNode(nodeId, nodeName);
        listOfNodes.add(node1);
        print(StringsForOutput.NODE_ADDED_SUCCESSFULLY_STRING);
        break InnerSwitchCase;
      case OUTER_SWITCH_CASE_OPTION_NINE:
        print(StringsForOutput.EXIT_MESSAGE_STRING);
        break OuterWhileLoop;
      default:
        print(StringsForOutput.DEFAULT_MESSAGE_STRING);
        break InnerSwitchCase;
    }
  }
}
