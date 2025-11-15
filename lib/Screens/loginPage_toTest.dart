import 'package:flutter/material.dart';

class LoginpageTotest extends StatefulWidget {
  const LoginpageTotest({super.key});

  @override
  State<LoginpageTotest> createState() => _LoginpageTotestState();
}

class _LoginpageTotestState extends State<LoginpageTotest> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                key: Key('email'),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please,enter your email';
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                key: Key('pass'),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please,enter your password';
                  return null;
                },
              ),

              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Welcome()),
                    );
                  }
                },
                key: Key('loginBtn'),
                child: Text('login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('welcome')));
  }
}
