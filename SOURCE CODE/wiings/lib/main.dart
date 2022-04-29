import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wiings/AUTHENTICATION/login.dart';
import 'package:wiings/Welcome.dart';
import 'package:wiings/database.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyA1ZFL4kT-VzWxUUsj7HYCfgU-pmJnTezM",
  //     appId: "1:232592072058:web:92143f96621a74f64acac3",
  //     messagingSenderId: "232592072058",
  //     projectId: "nirvanameet-c1c78",
  //   ),
  // );
  // FirebaseAuth.instance.currentUser == null ? signin = 'No' : signin = 'Yes';
  // signin == 'Yes' ? _fetch() : signin = 'No';
  // FirebaseAuth.instance.currentUser!.uid == null
  //     ? signin = "No"
  //     : signin = "Yes";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WIINGS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAppPage(title: 'WIINGS'),
    );
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Homepage.png'), fit: BoxFit.cover),
          ),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'WELCOME TO ',
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
              Image.asset('images/Logo.png', height: 350, width: 350),
              Container(
                height: 20,
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Userlogin()));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

_fetch() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((value) {
    var period = value.data()!;
    uname = period['Username'];
    email = period['Email id'];
    phonen = period['Phone Number'];
  });
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('payments')
      .doc(uid)
      .get()
      .then((value) {
    var val = value.data()!;
  });
  return;
}
