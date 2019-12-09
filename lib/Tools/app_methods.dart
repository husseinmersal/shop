import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppMethods{
  Future<bool> LoginUser({String email,String password});
  Future<bool> CreateUserAccount({String fullname,String phone,String email,String password});
  Future<bool> logOutUser();

  Future<DocumentSnapshot> getUserInfo(String userid);
  Future<String> addNewProduct({Map newProduct});
  Future<List<String>> uploadProductImages(
      {List<File> imageList, String docID});
  Future<bool> updateProductImages({
  String docID,
    List<String> data,
});


























}