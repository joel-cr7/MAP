import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCZsr02fyG0hA-oNbnS9rv-PAfD_nZ1gSM",
      appId: "1:921285478321:android:5a36ae7b42cc017f24df90",
      messagingSenderId: "921285478321",
      projectId: "flutter-firebase-14331",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterPage(),
      routes: {'/second': (context) => RegisterSuccess()},
    );
  }
}

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tableController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Firebase Register"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  return value!.trim().isEmpty ? "Email can't be empty" : null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (value) {
                  return value!.trim().isEmpty
                      ? "Password can't be empty"
                      : null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                ),
                validator: (value) {
                  return value!.trim().isEmpty
                      ? "Name can't be empty"
                      : null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _tableController,
                decoration: const InputDecoration(
                  labelText: "No. of tables",
                ),
                validator: (value) {
                  return value!.trim().isEmpty
                      ? "No. of table can't be empty"
                      : null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          _firebaseAuth.createUserWithEmailAndPassword(
                            email: _emailController.text, password: _passwordController.text
                          ).then((value) {
                            FirebaseFirestore.instance
                              .collection("RegistrationData")
                              .doc(value.user!.uid)
                              .set({"Email": value.user!.email, 
                              "Name": _nameController.text,
                              "No. of tables": _tableController.text,});

                            Navigator.pushNamed(context, '/second');
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration Successful')));
                          });
                        }
                      },
                      child: const Text('Register')
                    )
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}

class RegisterSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Successful'),
      ),
      body: Text("Success"),
    );
  }
}
