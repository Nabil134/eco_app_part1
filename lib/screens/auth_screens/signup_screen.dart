import 'package:ecco_app/screens/auth_screens/login_screen.dart';
import 'package:ecco_app/services/firebase_services.dart';
import 'package:ecco_app/utils/styles.dart';
import 'package:ecco_app/widgets/eco_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/ecotextfield.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailC = TextEditingController();
  bool ispassword = true;
  bool isretypepassword = true;
  bool formStateLoading = false;
  TextEditingController passwordC = TextEditingController();
  TextEditingController retypepasswordC = TextEditingController();
  FocusNode? passwordfocus;
  FocusNode? retypepasswordfocus;
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    retypepasswordC.dispose();
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
      if (passwordC.text == retypepasswordC.text) {
        String? accountstatus =
            await FirebaseServices.createaccount(emailC.text, passwordC.text);

        //print(accountstatus);
        if (accountstatus != null) {
          ecoDialogue(accountstatus);
          setState(() {
            formStateLoading = false;
          });
        } else {
          Navigator.pop(context);
        }

        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    }
  }
  /**submit end here*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*first portion start here*/
              const Text(
                'Welcome \n Please Create your Account',
                textAlign: TextAlign.center,
                style: EcoStyle.boldStyle,
              ),
              /*first portion end here*/
              const SizedBox(
                height: 50,
              ),
              /*second portion start here*/
              Column(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        /*Email TextField start here*/
                        EcoTextField(
                          check: true,
                          controller: emailC,
                          hintText: 'Email...',
                          isPassword: false,
                          inputAction: TextInputAction.next,
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
                          inputAction: TextInputAction.next,
                          focusNode: passwordfocus,
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
                        /*Retype Password TextField start here*/
                        EcoTextField(
                          controller: retypepasswordC,
                          hintText: 'Retype Password...',
                          isPassword: isretypepassword,
                          inputAction: TextInputAction.next,
                          focusNode: retypepasswordfocus,
                          icon: IconButton(
                            icon: isretypepassword
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isretypepassword = !isretypepassword;
                              });
                            },
                          ),
                          validate: (v) {
                            if (v!.isEmpty) {
                              return 'password should not be empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                        /*reType Password TextField end here*/
                        /*SignUp Button start here*/
                        EcoButton(
                          title: 'SignUp',
                          isLoginButton: true,
                          onPress: () {
                            submit();
                          },
                        ),
                        /*SignUp Button end here*/
                      ],
                    ),
                  ),
                ],
              ),
              /*second portion end here*/
              const SizedBox(
                height: 50,
              ),
              /*last portion start here*/
              EcoButton(
                title: 'Back To Login',
                isLoginButton: false,
                onPress: () {
                  Navigator.pop(context);
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
