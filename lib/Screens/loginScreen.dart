import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/cubit/login_api_cubit.dart';
import 'package:rwad2/models/loginResponse.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login',style: TextStyle(fontFamily: 'LibreBaskerville',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 34),),
      centerTitle: true,),      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [            
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if(value == null || value.isEmpty )
                    return 'Please,enter your email';
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.deepPurple,),
                    hintText: 'User Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey))
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if(value == null || value.isEmpty )
                    return 'Please,enter your password';
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password,color: Colors.deepPurple,),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey))
                  ),
                ),
                SizedBox(height: 60,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    minimumSize: Size(150, 50)
                  ),
                  onPressed: ()async{
                    setState(() {
                      if(_formkey.currentState!.validate()){
                         print('valid login');
                        }
                    },                    
                    );          
                    await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);      
                }, child: Text('Login',style: TextStyle(fontFamily: 'LibreBaskerville',fontWeight: FontWeight.bold,fontSize: 17),)),
                
              ],
            ),
          ),
        ),
      ),      
      );
  }
}
