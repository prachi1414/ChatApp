import 'package:demo1/components/my_button.dart';
import 'package:demo1/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller

  final emailController = TextEditingController();
  final passwordCotroller = TextEditingController();
  final ConfirmpasswordCotroller = TextEditingController();

  //sign up
  void signUp() {}

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
                const SizedBox(
                  height: 40,
                ),

                //logo

                Icon(
                  Icons.message,
                  size: 120,
                  color: Colors.grey[900],
                ),
                const SizedBox(
                  height: 40,
                ),

                //welcome back message

                Text(
                  "Let's register!",
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),

                const SizedBox(
                  height: 30,
                ),

                //email

                MyTextFiled(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),

                //password

                MyTextFiled(
                  controller: passwordCotroller,
                  hintText: 'password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),
                //Confirm password

                MyTextFiled(
                  controller: ConfirmpasswordCotroller,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),

                //sign up

                const SizedBox(
                  height: 30,
                ),

                MyButton(onTap: signUp, text: "Sign Up"),

                const SizedBox(
                  height: 40,
                ),
                //not member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Log in now!',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
