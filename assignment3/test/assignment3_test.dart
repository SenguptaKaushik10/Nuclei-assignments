import 'package:assignment3/exceptions/exception_handling.dart';
import 'package:assignment3/models/add_dependency.dart';
import 'package:assignment3/models/cyclic_dependency_handler.dart';
import 'package:assignment3/models/dependency_graph_node.dart';
import 'package:assignment3/utils/validation_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Exceptions testing', () {
    test('Check if node has ancestors', () {
      expect(
          () => ValidationUtils.checkIfNodeHasAncestors(0),
          throwsA(
              isA<NoAncestorOfThisNodeWhileDisplayingDescendentsException>()));
    });
    test('check if node has descendents', () {
      expect(
          () => ValidationUtils.checkIfNodeHasDescendents(0),
          throwsA(isA<
              NoDescendentOfThisNodeWhileDisplayingDescendentsException>()));
    });
    test('Check if node ID is unique', () {
      List<DependencyGraphNode> listOfNodes = [];
      DependencyGraphNode alreadyExistingNode = DependencyGraphNode(1, 'node1');
      listOfNodes.add(alreadyExistingNode);
      expect(() => ValidationUtils.checkIfNodeIDIsUnique(listOfNodes, 1),
          throwsA(isA<NotUniqueNodeIDException>()));
    });
    test('Check if node has immediate parents', () {
      expect(() => ValidationUtils.checkIfNodeHasParents(0),
          throwsA(isA<NoParentOfThisNodeWhileDisplayingParentsException>()));
    });
    test('Check if node has immediate children', () {
      expect(() => ValidationUtils.checkIfNodeHasChildren(0),
          throwsA(isA<NoChildrenOfThisNodeWhileDisplayingChildrenException>()));
    });
  });
  test('Check if cyclic dependency exists', () {
    DependencyGraphNode node1 = DependencyGraphNode(1, 'node1');
    DependencyGraphNode node2 = DependencyGraphNode(2, 'node2');
    DependencyGraphNode node3 = DependencyGraphNode(3, 'node3');
    expect(AddDependency.addDependency(node1, node2), equals(0));
    expect(AddDependency.addDependency(node2, node3), equals(0));
    expect(AddDependency.addDependency(node3, node1), equals(1));
  });
}
