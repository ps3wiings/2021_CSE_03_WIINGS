import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wiings/AUTHENTICATION/Signup.dart';
import 'package:wiings/Welcome.dart';

class Userlogin extends StatefulWidget {
  const Userlogin({Key? key}) : super(key: key);

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('WIINGS'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Signup.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
          child: ListView(
            children: [
              SizedBox(
                child: Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  controller: _pass,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {}, child: const Text('Forgot Password')),
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                child: ElevatedButton(
                  child: const Text('Sign In'),
                  onPressed: () {
                    print(_email);
                    print(_pass);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                        (route) => false);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have an account?',
                      style: TextStyle(color: Colors.white)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserSignup()));
                    },
                    child: const Text('Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
