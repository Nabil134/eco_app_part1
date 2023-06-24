import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  /*adminSignIn start here*/
  static Future<DocumentSnapshot> adminSignIn(id) async {
    var result = FirebaseFirestore.instance.collection("admin").doc(id).get();
    return result;
  }
  /*adminSignIn end here*/

  /*reateaccount function start here*/
  static Future<String?> createaccount(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "email already in user";
      } else if (e.code == "weak-password") {
        return "password is too weak";
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  /*reateaccount function end here*/
  /*signInAccount function start here */
  static Future<String?> signInAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
  /*signInAccount function end here */
}
