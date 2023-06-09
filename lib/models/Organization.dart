import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'UserModel.dart';

class Organization{
  final String orgaId;
  final String owner;
  final String name;
  List<String> userList;

  Organization({
    required this.orgaId,
    required this.owner,
    required this.name,
    required this.userList,
  });

  factory Organization.fromJson(Map<String, dynamic> json){
    return Organization(orgaId: json['id'],
      owner: json['owner'],
      name: json['name'],
      userList: json['userList']
    );
  }

  factory Organization.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data() as Map<String, dynamic>;
    var userListData = data['userList'] ?? [];
    print("!!!!!!!! userListData: $userListData");
    //List<UserModel> userList2 = userListData.map((e) => null)
    //List<String> userList = userListData.map((userData) => userList.add(userData)).toList();
    return Organization(orgaId: 'id', owner: 'owner', name: 'name', userList: List.from(data['userList']));
  }

  Map<String, dynamic> userListToJson() {
    Map<String, dynamic> jsonMap = {};
    /*for (int i = 0; i < userList.length; i++) {
      jsonMap['element_$i'] = userList[i].mail;
    }
    print("!!!!! UserList Json Map:  $jsonMap");*/
    return jsonMap;
  }

  List<UserModel> jsonMapToUserList(Map<String, dynamic> jsonMap){
    List<UserModel> userList = [];
    /*jsonMap.forEach((key, value) { 
      Use
    });*/
    
    throw new UnimplementedError();
  }

  Map<String, Object> toJson(){
    return {'id': orgaId, 'owner': owner, 'name': name, 'userList': userList.toString()};
  }
}