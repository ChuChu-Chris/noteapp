import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(9.8),
          child: TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              hintText: "Enter Email Address",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.8),
          child: TextField(
            controller: _password,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Enter Password"),
            enableSuggestions: false,
            autocorrect: false,
          ),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              await FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: password);
              // devtools.log(UserCredential.toString());
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/notes/',
                (route) => false,
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'wrong-password') {
                devtools.log('please enter a valid password');
              } else if (e.code == 'user-not found') {
                devtools.log('User not found');
              } else {
                devtools.log('Somehing else haoppen');
                devtools.log(e.code);
              }
            }
          },
          child: const Text('Login'),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/register', (route) => false);
            },
            child: const Text("Not Registered yet? Register Here!"))
      ]),
    );
  }
}
