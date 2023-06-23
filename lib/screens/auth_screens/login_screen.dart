import 'package:ecco_app/screens/auth_screens/signup_screen.dart';
import 'package:ecco_app/screens/bottom_screens/home_screen.dart';
import 'package:ecco_app/services/firebase_services.dart';
import 'package:ecco_app/utils/styles.dart';
import 'package:ecco_app/widgets/eco_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/ecotextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailC = TextEditingController();
  bool ispassword = true;
  TextEditingController passwordC = TextEditingController();
  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  /*ecoDialogue start here */
  Future<void> ecoDialogue(String error) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(error),
            actions: [
              EcoButton(
                title: 'CLOSE',
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  /*ecoDialogue end here*/
  /*  submit start here*/
  submit() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });

      String? accountstatus =
          await FirebaseServices.signInAccount(emailC.text, passwordC.text);

      //print(accountstatus);
      if (accountstatus != null) {
        ecoDialogue(accountstatus);
        setState(() {
          formStateLoading = false;
        });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    }
  }

  /*submit end here*/

  final formkey = GlobalKey<FormState>();
  bool formStateLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*first portion start here*/
              const Text(
                'Welcome \n Please Login First',
                textAlign: TextAlign.center,
                style: EcoStyle.boldStyle,
              ),
              /*first portion end here*/
              /*second portion start here*/
              Column(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        /*Email TextField start here*/
                        EcoTextField(
                          controller: emailC,
                          hintText: 'Email...',
                          isPassword: false,
                          icon: Icon(Icons.email),
                          validate: (v) {
                            if (v!.isEmpty) {
                              return 'email is badly formattes';
                            } else {
                              return null;
                            }
                          },
                        ),
                        /*Email TextField end here*/
                        /*Password TextField start here*/
                        EcoTextField(
                          controller: passwordC,
                          hintText: 'Password...',
                          isPassword: ispassword,
                          icon: IconButton(
                            icon: ispassword
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                ispassword = !ispassword;
                              });
                            },
                          ),
                          validate: (v) {
                            if (v!.isEmpty) {
                              return 'password is badly formattes';
                            } else {
                              return null;
                            }
                          },
                        ),
                        /*Password TextField end here*/
                        /*login Button start here*/
                        EcoButton(
                            title: 'Login',
                            isLoginButton: true,
                            onPress: () {
                              submit();
                            }),
                        /*login Button end here*/
                      ],
                    ),
                  ),
                ],
              ),
              /*second portion end here*/
              /*last portion start here*/
              EcoButton(
                title: 'Create New Account',
                isLoginButton: false,
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
              ),
              /*last portion end here*/
            ],
          ),
        ),
      ),
    );
  }
}
