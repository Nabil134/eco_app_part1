import 'package:ecco_app/screens/web_side/web_main_screen.dart';
import 'package:ecco_app/services/firebase_services.dart';
import 'package:ecco_app/utils/styles.dart';
import 'package:ecco_app/widgets/eco_button.dart';
import 'package:ecco_app/widgets/eco_dialogue.dart';
import 'package:ecco_app/widgets/ecotextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WebLogin extends StatefulWidget {
  WebLogin({super.key});

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  TextEditingController userNameC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool formStateLoading = false;
//
/*submit start here */
  submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });
      await FirebaseServices.adminSignIn(userNameC.text).then((value) async {
        if (value['username'] == userNameC.text &&
            value['password'] == passwordC.text) {
          try {
            UserCredential user =
                await FirebaseAuth.instance.signInAnonymously();
            if (user != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WebMainScreen()));
            }
          } catch (e) {
            setState(() {
              formStateLoading = false;
            });
            showDialog(
                context: context,
                builder: (_) {
                  return EcoDialogue(
                    title: e.toString(),
                  );
                });
          }
        }
      });
    }
  }

  /*submit end here*/
  //
  Submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });
      await FirebaseServices.adminSignIn(userNameC.text).then((value) async {
        if (value['username'] == userNameC.text &&
            value['password'] == passwordC.text) {
          try {
            UserCredential user =
                await FirebaseAuth.instance.signInAnonymously();
            if (user != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WebMainScreen()));
            }
          } catch (e) {
            setState(() {
              formStateLoading = false;
            });
            showDialog(
                context: context,
                builder: (_) {
                  return EcoDialogue(
                    title: e.toString(),
                  );
                });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(12)),
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /*first portion start here */
                    const Text(
                      "WELCOME ADMIN",
                      style: EcoStyle.boldStyle,
                    ),
                    /*first portion end here */
                    /*second portion start here */
                    const Text(
                      "Log in to your Account",
                      style: EcoStyle.boldStyle,
                    ),
                    /*second portion end here */
                    /*Username TextField start here*/
                    EcoTextField(
                      hintText: 'UserName...',
                      controller: userNameC,
                      validate: (v) {
                        if (v!.isEmpty) {
                          return 'email should not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*Username TextField end here*/

                    /*Password TextField start here*/
                    EcoTextField(
                      hintText: 'Password',
                      controller: passwordC,
                      isPassword: true,
                      validate: (v) {
                        if (v!.isEmpty) {
                          return 'password should not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*Password TextField end here*/
                    /*Login start here*/
                    EcoButton(
                      isLoginButton: true,
                      title: "LOGIN",
                      onPress: () {
                        submit(context);
                      },
                    ),
                    /*Login end here*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
