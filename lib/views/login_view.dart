import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/constants/routes.dart';
import 'package:mynoteapp/utilities/show_error_dialog.dart';

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
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  notesRoute,
                  (route) => false,
                );
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  verifyEmailRoute,
                  (route) => false,
                );
              }

              // devtools.log(UserCredential.toString());

            } on FirebaseAuthException catch (e) {
              if (e.code == 'wrong-password') {
                await showErrorDialog(context, " Wrong Credentials");
              } else if (e.code == 'user-not found') {
                await showErrorDialog(context, " User not found");
              } else {
                await showErrorDialog(
                  context,
                  'Error: ${e.code}',
                );
              }
            } catch (e) {
              await showErrorDialog(
                context,
                e.toString(),
              );
            }
          },
          child: const Text('Login'),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text("Not Registered yet? Register Here!"))
      ]),
    );
  }
}
