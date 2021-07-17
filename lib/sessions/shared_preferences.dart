// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //   SharedPreferences? preferences;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     initializePreference().whenComplete((){
// //       setState(() {});
// //     });
// //   }
// //
// //   Future<void> initializePreference() async{
// //     this.preferences = await SharedPreferences.getInstance();
// //   }
// //
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   SharedPreferences? preferences;
//
//   @override
//   void initState() {
//     super.initState();
//     initializePreference().whenComplete(() {
//       setState(() {});
//     });
//   }
//
//   void _incrementCounter() async {
//     setState(() {
//       _counter++;
//       this.preferences?.setInt("counter", _counter);
//     });
//   }
//
//   Future<void> initializePreference() async {
//     this.preferences = await SharedPreferences.getInstance();
//     this.preferences?.setString("name", "Peter");
//     this.preferences?.setStringList("infoList", ["developer", "mobile dev"]);
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
//               'The user ${this.preferences?.getString("name")} pushed the button this many times:',
//             ),
//             Text(
//               '${this.preferences?.getInt("counter") ?? 0}',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
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
