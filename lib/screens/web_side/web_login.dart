import 'package:ecco_app/screens/web_side/web_main_screen.dart';
import 'package:ecco_app/utils/styles.dart';
import 'package:ecco_app/widgets/eco_button.dart';
import 'package:ecco_app/widgets/ecotextfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WebLogin extends StatelessWidget {
  WebLogin({super.key});
  TextEditingController userNameC = TextEditingController();

  TextEditingController passwordC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool formStateLoading = false;
  String email = 'admin@gmail.com';
  String password = 'admin123';
  submit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (userNameC.text == email && passwordC.text == password) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => WebMainScreen()));
      }
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
                    const Text(
                      "WELCOME ADMIN",
                      style: EcoStyle.boldStyle,
                    ),
                    const Text(
                      "Log in to your Account",
                      style: EcoStyle.boldStyle,
                    ),
                    EcoTextField(
                      hintText: 'Email',
                      controller: userNameC,
                    ),
                    EcoTextField(
                      hintText: 'Password',
                      controller: passwordC,
                      isPassword: true,
                    ),
                    EcoButton(
                      isLoginButton: true,
                      title: "LOGIN",
                      onPress: () {
                        submit(context);
                      },
                    ),
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
