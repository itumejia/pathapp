import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



Future<User> getCurrentUser()async{
  try{
    final author= FirebaseAuth.instance;
    final user= await author.currentUser;
    if(user!=null){
      print(user.email);
    }
    return user;
  }catch(e){
    print(e);
    return null;
  }
}

Future<Map<String, dynamic>> getData(String email) async{
  Map<String, dynamic> res=null;
  final cloud=FirebaseFirestore.instance.collection('/usuarios');
  final DocumentReference document = cloud.doc(email);
  await document
      .get()
      .then((DocumentSnapshot documentSnapshot) async{
    if (documentSnapshot.exists) {
      res= documentSnapshot.data();
    }
  });
  return res;
}