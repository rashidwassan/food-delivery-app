import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:sayfood/models/user.dart';

class FirebaseServices {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<String?> signUpUserOnFirebase(
      String email, String password, String name, String phone) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      await completeUserOnboarding(SFUser(
          uid: userCredential.user!.uid,
          email: email,
          name: name,
          phone: phone,
          profileImageUrl: '',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          isActive: true,
          dob: 2,
          points: 3,
          permisions: const ['admin', 'customer'],
          favorites: const []));
      return null;
    } catch (e) {
      return 'Error signing up: $e';
    }
  }

  static Future<String?> completeUserOnboarding(SFUser user) async {
    try {
      await firestore.collection('users').doc(user.uid).set(user.toMap());

      return null;
    } catch (e) {
      return 'Error signing up: $e';
    }
  }

  static Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      return 'Error Signing in: $e';
    }
  }

  static Future<bool> isEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user!.emailVerified;
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      GetSecureStorage().remove('isLoggedIn');
    } catch (e) {
      debugPrint('Error signing out: $e');
    }
  }

  static Future<String?> sendPasswordRestEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null;
    } catch (e) {
      return 'Error, $e';
    }
  }

  static Future<String?> verifyPasswordResetCode(String code) async {
    try {
      await FirebaseAuth.instance.verifyPasswordResetCode(code);
      return null;
    } catch (e) {
      return 'Error, please try again later!';
    }
  }

  // static Stream<QuerySnapshot> getMessagesStreamFromACollection(
  //     {required String collectionName}) {
  //   CollectionReference messagesCollection =
  //       firestore.collection(collectionName);
  //   return messagesCollection
  //       .orderBy('timestamp', descending: true)
  //       .snapshots();
  // }
}
