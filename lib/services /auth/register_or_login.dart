import 'package:demo1/Log_in_page.dart';
import 'package:demo1/register_page.dart';
import 'package:flutter/material.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  // initially show the log in page 
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
 });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return Log_in_page(onTap: togglePages);
    }else{
      return RegisterPage(onTap : togglePages);
    }
  }
}