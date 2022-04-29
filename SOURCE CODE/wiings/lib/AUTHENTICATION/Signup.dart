import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wiings/AUTHENTICATION/authentication.dart';
import 'package:wiings/AUTHENTICATION/login.dart';
import 'package:wiings/Welcome.dart';
import 'package:wiings/database.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({Key? key}) : super(key: key);

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
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
                      width: MediaQuery.of(context).size.width / 2,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign Up',
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
                SizedBox(
                  child: Flexible(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
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
                  padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                  child: ElevatedButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // AuthClass()
                        //     .createAccount(
                        //         email: _email.text.trim(),
                        //         password: _pass.text.trim())
                        //     .then((value) {
                        //   if (value == "Account created") {
                        //     setState(() {
                        //       via = "email";
                        //       FireStoreDataBase().addUser();
                        //       // _fetch();
                        //       signin = "Yes";
                        //     });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()),
                            (route) => false);
                        // }
                        // });
                      }),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Userlogin()));
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
