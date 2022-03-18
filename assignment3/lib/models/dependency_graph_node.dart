class DependencyGraphNode {
  int nodeID = 0; //should be unique
  String nodeName = 'defaultNode';
  Map<String, dynamic>? additionalInfo = <String, dynamic>{};
  List<DependencyGraphNode> children = [];
  List<DependencyGraphNode> parents = [];
  int flagToCheckIfNodeAlreadyVisited = 0;

  DependencyGraphNode(this.nodeID, this.nodeName, [this.additionalInfo]);

  void addParent(DependencyGraphNode parent) {
    parents.add(parent);
  }

  void addChild(DependencyGraphNode child) {
    children.add(child);
  }

  void deleteParent(DependencyGraphNode parent) {
    parents.remove(parent);
  }

  void deleteChild(DependencyGraphNode child) {
    children.remove(child);
  }

  void displayAncestors(DependencyGraphNode node) {
    int lenOfParents = node.parents.length;
    for (int i = 0; i < lenOfParents; i++) {
      print('Node ID: ${node.parents[i].nodeID}');
      print('Node Name: ${node.parents[i].nodeName}');
      print('\n');
      displayAncestors(node.parents[i]);
    }
  }

  void displayDescendants(DependencyGraphNode node) {
    int lenOfChildren = node.children.length;
    for (int i = 0; i < lenOfChildren; i++) {
      print('Node ID: ${node.children[i].nodeID}');
      print('Node Name: ${node.children[i].nodeName}');
      print('\n');
      displayDescendants(node.children[i]);
    }
  }
}
