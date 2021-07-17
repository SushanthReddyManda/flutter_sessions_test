import 'dart:async';
import 'dart:io';
import 'package:sessions_test/id_1/home_screen.dart';
import 'package:flutter/material.dart';

import 'id_2/shared_preferences.dart';
import 'id_2/login.dart';
import 'id_2/profile.dart';

//=========  Counter Code : id 1 =========================
// void main() {
//   runApp(MyApp());
// }
//
// // ignore: use_key_in_widget_constructors
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: MyHomePage(title: 'Flutter Demo Home Page'),
//       home: SharedPreferencesDemo(),
//     );
//   }
// }
//========= End  Counter Code : id 1 =========================

//=========  LoginCode : id 2 =========================
void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool isLoggedIn = false;

  MyAppState() {
    MySharedPreferences.instance
        .getBooleanValue("loggedin")
        .then((value) => setState(() {
              isLoggedIn = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: isLoggedIn ? Profile() : Login());
  }
}

//=========  End LoginCode : id 2 =========================

//======================  Experiment codes =====================

//====== Exp code 1 ============

// void main() {
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var _token = prefs.getString('token');
//   // ignore: avoid_print
//   print(_token);
//   runApp(MaterialApp(home: _token == null ? const Login() : HomePage()));
// }
// }

//======= Exp code 2 ==============

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences.getInstance().then((instance) {
//     StorageService().sharedPreferencesInstance =
//         instance; // Storage service is a service to manage all shared preferences stuff. I keep the instance there and access it whenever i wanted.
//     runApp(MyApp());
//   });
// }
//
// // ignore: use_key_in_widget_constructors
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'App Title',
//       debugShowCheckedModeBanner: false,
//       home: _checkUserLoggedIn() ? HomePage() : const Login(),
//     );
//   }
// }
//
// bool _checkUserLoggedIn() {
//   return _storageService.getFromShared(
//       'isLoggedIn'); //  Just a get method from shared preferences
// }
