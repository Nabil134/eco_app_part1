import 'package:ecco_app/firebase_options.dart';
import 'package:ecco_app/screens/auth_screens/login_screen.dart';
import 'package:ecco_app/screens/landing_screen.dart';
import 'package:ecco_app/screens/loyout_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecco App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        home: LayoutScreen(),
      ),
    );
  }
}
