import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class FirebaseDB {

  final userRef = FirebaseFirestore.instance.collection('users');


  Future<void> addUser(String name, int age) async{
    await userRef.add({
      'name' : name,
      'age' : age
    });
  }


  Future<void> updateUser(String Id, String newName, int newAge) async{
    await userRef.doc(Id).update({
      'name' : newName,
      'age' : newAge
    });
  }

  Future<void> deleteUser(String Id) async{
    await userRef.doc(Id).delete();
  }

  Stream<QuerySnapshot> getUsers(){
    return userRef.orderBy('name').snapshots();
  }
}