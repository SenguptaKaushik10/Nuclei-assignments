import 'package:assignment2/models/user.dart';
import 'package:assignment2/storage/persistant_storage.dart';

class SessionStorage {
  List<User> _allUsers = [];
  static SessionStorage? _instance;
  static SessionStorage get instance => _instance ??= SessionStorage._();
  SessionStorage._();

  void addUserDetails(User newUser) {
    _allUsers.add(newUser);
  }

  List<User> getuserDetails() {
    return _allUsers;
  }

  void deleteUserDetails(int rollNoToBeDeleted) {
    _allUsers.removeWhere((student) => student.rollNo == rollNoToBeDeleted);
  }

  void saveUserDetails() {
    PersistantStorage.instance.save(_allUsers);
  }

  List<User> readUserDetails() {
    List<User> newList = PersistantStorage.instance.read();
    _allUsers = [...newList];
    return _allUsers;
  }
}
