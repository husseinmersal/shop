import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/Tools/app_tools.dart';
import 'app_data.dart';
import 'package:shop/Tools/app_methods.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> CreateUserAccount({String fullname, String phone, String email, String password}) async {
    // TODO: implement CreateUserAccount
    FirebaseUser user;

    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        await firestore
            .collection(userData)
            .document(user.uid)
            .setData({

          userID : user.uid,
          acctfullName: fullname,
          userEmail : email,
          phoneNumber : phone,
          userPassword : password
        });

        writeDataLocally(key: userID,value: user.uid);
        writeDataLocally(key: fullname,value: fullname);
        writeDataLocally(key: userEmail,value: userEmail);
        writeDataLocally(key: userPassword,value: password);
      }
    } on PlatformException catch (e) {
      //print(e.details);
      return notComplete();
    }


    return user == null ? notComplete() : complete();

  }

  @override
  Future<bool> LoginUser({String email, String password}) async {
    // TODO: implement logginUser

    FirebaseUser user;
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        await writeDataLocally(key: userID, value: userInfo[userID]);
        await writeDataLocally(key: acctfullName, value: userInfo[acctfullName]);
        await writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        await writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        await writeDataLocally(key: photoURL, value: userInfo[photoURL]);
        await writeBoolDataLocally(key: logedIN, value: true);

        print(userInfo[userEmail]);
      }

    } on PlatformException catch (e) {
      //print(e.details);
      return notComplete();
    }

    return user == null ? notComplete() : complete();
  }

  @override
  Future<bool> logOutUser() async {
    // TODO: implement logOutUser
    await auth.signOut();
    await clearDataLocally();

    return complete();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userid) async {
    // TODO: implement getUserInfo
    return await firestore.collection(userData).document(userid).get();
    return null;
  }

  @override
  Future<String> addNewProduct({Map newProduct}) async {
    // TODO: implement addNewProduct

    String documentID;
    await firestore.collection(appProducts).add(newProduct).then((documentRef) {
      documentID = documentRef.documentID;
    });
    return documentID;
  }

  @override
  Future<List<String>> uploadProductImages({List< File> imageList, String docID}) async {
    // TODO: implement uploadProductImages
    List<String> imagesUrl = List();

    try{
      for(int s=0; s < imageList.length; s++){
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child(appProducts)
            .child(docID)
            .child(docID + "$s.jpg");

        StorageUploadTask uploadTask = storageReference.putFile(imageList[s]);
        StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
        String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        imagesUrl.add(downloadUrl.toString());



        /*StorageUploadTask uploadTask = storageReference.putFile(imageList[s]);
        Uri downloadUrl = (await uploadTask.future).downloadUrl;
        imagesUrl.add(downloadUrl.toString());*/
      }
    }on PlatformException catch (e){
      imagesUrl.add(error);
      print(e.details);
    }

    return null;
  }

  @override
  Future<bool> updateProductImages({String docID, List<String> data}) async {
    // TODO: implement updateServiceImages
    bool msg;
    await firestore
        .collection(appProducts)
        .document(docID)
        .updateData({productImages: data}).whenComplete((){
          msg=true;

    });

    return msg;
  }







}




















    // TODO: implement CreateUserAccount
    /*FirebaseUser user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (user != null) {
      await firestore
          .collection(userData)
          .document(user.uid)
          .setData({

        userID : user.uid,
        userEmail : email,
        phoneNumber : phone,
        userPassword : password
      }).whenComplete((){
        writeDataLocally(key: userID,value: user.uid);
        writeDataLocally(key: fullname,value: fullname);
        writeDataLocally(key: userEmail,value: userEmail);
        writeDataLocally(key: userPassword,value: password);
        return complete();
      }).catchError((){
        return notComplete();
      });
    }

    return user == null ? notComplete() : complete();
  }

  @override
  Future<bool> LoginUser({String email, String password}) async {
    // TODO: implement LoginUser

    FirebaseUser user ;
    try{user = await auth.signInWithEmailAndPassword(
        email: email, password: password);}catch on PlatformException(e){
      return notComplete();
    }

    return user == null ? notComplete() : complete();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }
}

*/





















