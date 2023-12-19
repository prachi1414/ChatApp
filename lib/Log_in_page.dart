import 'package:demo1/components/my_button.dart';
import 'package:demo1/components/my_text_field.dart';
import 'package:demo1/services%20/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Log_in_page extends StatefulWidget {
  final void Function()? onTap;
  const Log_in_page({Key? key, required this.onTap}) : super(key: key);


  @override
  State<Log_in_page> createState() => _Log_in_pageState();
}

class _Log_in_pageState extends State<Log_in_page> {

  //text controller 

  final emailController = TextEditingController();
  final passwordCotroller = TextEditingController();

  //Sign in 

  void signIn() async {
    //get the auth service 
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.SignInWithEmailandPassword(
        emailController.text, 
        passwordCotroller.text,
        );
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),),),);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
              
                //logo


                Icon(
                  Icons.message, 
                  size: 120,
                  color: Color.fromARGB(255, 12, 76, 108),
                  ),
                  const SizedBox(height: 40,),
            
                //welcome back message


              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ) ,
              ),

              const SizedBox(height: 30,),
            
                //email


                MyTextFiled(
                  controller: emailController, 
                  hintText: 'Email', 
                  obscureText: false,
                  ),
                  const SizedBox(height: 10,),
              
                //password


                  MyTextFiled(
                  controller: passwordCotroller, 
                  hintText: 'password', 
                  obscureText: true,
                  ),
               
                //sign in


                const SizedBox(height: 30,),
                 
                  MyButton(
                     onTap: signIn,
                     text: "Sign In",
                    ),
               
                      const SizedBox(height: 40,),               
                //not member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                        const Text('not a member?'),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register now!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 76, 108)
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
            )
          ),
        ),
      ),
    );
  }
}