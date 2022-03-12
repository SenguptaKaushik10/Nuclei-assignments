import 'dart:convert';
import 'package:assignment2/models/user.dart';
import 'package:assignment2/storage/session_storage.dart';
import 'dart:io';

class PersistantStorage {
  static PersistantStorage? _instance;
  static PersistantStorage get instance => _instance ??= PersistantStorage._();
  PersistantStorage._();

  List<User> userList = SessionStorage.instance.getuserDetails();

  String _returnJsonString(List<User> userList) {
    var userListMap = <String, String>{};
    userList.forEach((user) {
      userListMap[user.rollNo.toString()] = jsonEncode(user.toJson());
    });
    return jsonEncode(userListMap);
  }

  void save(List<User> userList) {
    String userListMapInString = _returnJsonString(userList);
    File('C://Users//acer//Desktop//Learning projects//git//Nuclei-assignments//assignment2//lib//storage//persistant_storage_file.txt')
        .writeAsStringSync(userListMapInString);
  }

  List<User> read() {
    File f = File(
        'C://Users//acer//Desktop//Learning projects//git//Nuclei-assignments//assignment2//lib//storage//persistant_storage_file.txt');

    if (f.existsSync() == false) {
      print("The file doesn't exist");
      return [];
    }
    String jsonString = f.readAsStringSync();
    return _jsonStringToUserListMap(jsonString);
  }

//return userListMap
  List<User> _jsonStringToUserListMap(String jsonString) {
    List<User> listOfAlreadyAvailableUsers = [];
    Map<String, dynamic> userListMap = jsonDecode(jsonString);
    userListMap.forEach((studentRollNo, studentDetails) {
      var studentMap = jsonDecode(studentDetails);
      var user = User.fromJson(studentMap);
      listOfAlreadyAvailableUsers.add(user);
    });
    return listOfAlreadyAvailableUsers;
  }
}
