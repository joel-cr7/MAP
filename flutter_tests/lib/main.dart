import 'package:flutter/material.dart';

void main() {
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
      routes: {
        '/second': (context) => LoginPage(),
        '/success': (context) => SuccessPage()
      },
    );
  }
}

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registeration Form"),
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
                  return value!.trim().isEmpty ? "Name can't be empty" : null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _genderController,
                decoration: const InputDecoration(
                  labelText: "Gender",
                ),
                validator: (value) {
                  return value!.trim().isEmpty ? "Enter a gender" : null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _bloodGroupController,
                decoration: const InputDecoration(
                  labelText: "Blood Group",
                ),
                validator: (value) {
                  return value!.trim().isEmpty ? "Enter a blood group" : null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/success');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Registration Successful')));
                            }
                          },
                          child: const Text('Register'))),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              OutlineButton(
                onPressed: () => {Navigator.pushNamed(context, "/second")},
                child: const Text("Already Registered? Login"),
              )
            ]),
          ),
        ));
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Form'),
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
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/success');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Login Successful')));
                            }
                          },
                          child: const Text('Login'))),
                ],
              ),
            ]),
          ),
        ));
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Successful Login/Register'),
        ),
        body: const Center(
            child: Text('Success', style: TextStyle(fontSize: 20))));
  }
}