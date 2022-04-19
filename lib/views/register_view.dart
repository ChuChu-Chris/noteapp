import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Register'), //to get a default blue nav-bar with a title of register
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(children: [
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
                    decoration:
                        const InputDecoration(hintText: "Enter Password"),
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      final UserCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password);
                      print(UserCredential);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('weak password');
                      } else if (e.code == 'email-already-in-use') {
                        print('email is already in use');
                      } else if (e.code == 'invalid-email') {
                        print('invalid email');
                      } else {
                        print(e.code);
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
              ]);

            default:
              return const Center(
                child: Text("Loading..."),
              );
          }
        },
      ),
    );
  }
}
