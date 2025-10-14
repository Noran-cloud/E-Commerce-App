import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:rwad2/Screens/loginScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();
  var _userController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  bool isSecure1 = true, isSecure2 = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                Text('Create an account, It\'s free',style: TextStyle(fontSize: 17)),
                SizedBox(height: 30,),
                Align(
                  alignment:Alignment.topLeft,
                  child: Text('Username',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                TextFormField(
                  controller: _userController,
                  validator: (value) {
                    if(value == null || value.isEmpty)
                    return 'Please,Enter your username';
                    if(value.length <= 2)
                    return 'Your username should be 3 or more characters';
                  },
                  decoration: InputDecoration(            
                  enabledBorder: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 7,),
                Align(
                  alignment:Alignment.topLeft,
                  child: Text('Email',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if(value == null || value.isEmpty)
                    return 'Please,Enter your email';
                    if(!value.contains('@'))
                    return 'Please,Enter valid email';
                  },
                  decoration: InputDecoration(            
                    enabledBorder: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 7,),
                Align(
                  alignment:Alignment.topLeft,
                  child: Text('Password',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isSecure1,
                  validator: (value) {
                    if(value == null || value.isEmpty)
                    return 'Please,Enter your password';
                    if(value.length < 8)
                    return 'Your password should be 8 or more characters';
                  },
                  decoration: InputDecoration(            
                    enabledBorder: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isSecure1 = !isSecure1;
                        });
                      }
                    , icon: Icon(isSecure1? Icons.visibility_off : Icons.visibility))
                  ),
                ),
                SizedBox(height: 7,),       
                Align(
                  alignment:Alignment.topLeft,
                  child: Text('Confirm Password',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: isSecure2,
                  validator: (value) {
                    if(value == null || value.isEmpty)
                    return 'Please,Confirm your passoword';
                    if(_confirmPasswordController.text != _passwordController.text)
                    return 'Wrong password';
            
                  },
                  decoration: InputDecoration(            
                    enabledBorder: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isSecure2 = !isSecure2;
                        });
                      }
                    , icon: Icon(isSecure2? Icons.visibility_off : Icons.visibility))
                  ),
                ),
                SizedBox(height: 100,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 65),
                    side: BorderSide(color: Colors.black)
                  ),
                  onPressed: () async{
                    if(_formKey.currentState?.validate() == true)
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Username: ${_userController.text}       Email: ${_emailController.text}        Password: ${_passwordController.text}')));
                   await auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                  }, 
                  child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
                  ),
                  SizedBox(height: 20,),
                  GoogleSignInButton(loadingIndicator: CircularProgressIndicator(), clientId: '888995499358-vj6qeqpcishj7hi4q35g61mab1s14m42.apps.googleusercontent.com'),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account ? '),
                    GestureDetector(child: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginscreen()));
                    },)
                     
                  ],
                )
              ],
            ),
          ),
        ),
      ),)
    );
  }
}