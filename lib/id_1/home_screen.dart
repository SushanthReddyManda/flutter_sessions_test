import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// =================  Method -- 1 ==================================

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var fileName = 'Counter';
//   int _counter = 0;
//   SharedPreferences? preferences;
//
//   @override
//   void initState() {
//     super.initState();
//     // initializePreference().whenComplete(() {
//     //   setState(() {});
//     // });
//     updateCounter().getComplete(() {
//       setState(() {});
//     });
//   }
//
//   void _incrementCounter() async {
//     setState(() {
//       updateCounter();
//     });
//   }
//
//   // Future<void> initializePreference() async {
//   // preferences = await SharedPreferences.getInstance();
//   // preferences?.setString("name", "Peter");
//   // preferences?.setStringList("infoList", ["developer", "mobile dev"]);
//   updateCounter() {
//     //
//     getCounter() async {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       _counter = (preferences.getInt(fileName) ?? 0);
//       return _counter;
//     }
//
//     putCounter(counter) async {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       preferences.setInt(fileName, counter);
//       // );
//     }
//
//     // increment() async {
//     //   setState(() {
//     getCounter();
//     _counter++;
//     putCounter(_counter);
//     //   });
//     // }
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'The user ${preferences?.getString("name")} pushed the button this many times:',
//             ),
//             Text(
//               '${preferences?.getInt("counter") ?? 0}',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class Payment {
//   final int accountNumber;
//   final String accountName;
//
//   Payment({required this.accountNumber, required this.accountName});
//
//   factory Payment.fromJson(Map<String, dynamic> json) {
//     return Payment(
//       accountName: json['accountName'],
//       accountNumber: json['accountNumber'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'accountName': accountName,
//         'accountNumber': accountNumber,
//       };
// }
//
// Future<void> initializePreference() async {
//   this.preferences = await SharedPreferences.getInstance();
//   this.preferences?.setString("name", "Peter");
//   this.preferences?.setStringList("infoList", ["developer", "mobile dev"]);
//   await storingPayment();
// }
//
// Future<void> storingPayment() async {
//   Payment payment = Payment(accountName: "Peter", accountNumber: 123);
//   String storePayment = jsonEncode(payment.toJson());
//   await this.preferences?.setString('payment', storePayment);
//   await retrievePayment();
// }
//
// Future<void> retrievePayment() async {
//   String? result = this.preferences?.getString("payment");
//   Map<String, dynamic> decoded = jsonDecode(result!);
//   print(Payment.fromJson(decoded).accountName);
// }
//
// Future<bool> removePayment() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   return preferences.remove("payment");
// }

// ==================   Method  --2 ============================================

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SharedPreferences Demo',
//       home: SharedPreferencesDemo(),
//     );
//   }
// }

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt("counter", counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Demo"),
      ),
      body: Center(
          child: FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                        'This should persist across restarts.',
                      );
                    }
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//================================================= Method --3 login page ============================

// You can navigate to the Login page if the user details are saved in the storage else to the Home page with the below code
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var email = prefs.getString('email');
//   print(email);
//   runApp(MaterialApp(home: email == null ? Login() : Home()));
// }
// Save the required user details after the successful login
//
// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: RaisedButton(
//           onPressed: () async {
//             //after the login REST api call && response code ==200
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             prefs.setString('email', 'useremail@gmail.com');
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (BuildContext ctx) => Home()));
//           },
//           child: Text('Login'),
//         ),
//       ),
//     );
//   }
// }
// clear the details on logout
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () async {
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             prefs.remove('email');
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (BuildContext ctx) => Login()));
//           },
//           child: Text('Logout'),
//         ),
//       ),
//     );
//   }
// }
