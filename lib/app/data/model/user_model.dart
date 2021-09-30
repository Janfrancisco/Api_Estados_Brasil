import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String surname;
  String email;

  String get youEmail => this.email;
  String get getName => this.name;

  UserModel({this.id, this.name, this.surname, this.email});

  //Get the User from Cloud Firestore and become to the a UserModel object
  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.id;
    this.name = documentSnapshot['name'];
    this.surname = documentSnapshot['surname'];
    this.email = documentSnapshot['email'];
  }

  //Becomes a UserModel object to a Map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    return data;
  }
}
