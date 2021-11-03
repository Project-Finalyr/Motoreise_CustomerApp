import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motoreise_app/signup_form.dart';
import 'primary_button.dart';
import 'login_screen.dart';
TextStyle textButton = TextStyle(
  color: Colors.deepPurple,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
class SignUpFormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return SignUpFormScreenState();
  }
}

class SignUpFormScreenState extends State<SignUpFormScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 30),
                child:Text(
                  'Sign Up with email',
                  style: TextStyle(color: Color(0xFF1B383A), fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child:Row(
                  children: [
                    Text(
                      'It is quick and easy',
                      style: TextStyle(
                          color: Color(0xFF59706F), fontSize: 18, fontWeight: FontWeight.w500),
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SignUpForm(),
              ),
              SizedBox(
                height: 50,

              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),
                        ));
                  },
                  child: Text(
                    'Login Here',
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                        color: Color(0xFF59706F), fontSize: 15, fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
                  SizedBox(height: 10,),
            ],
          ),
        ),

      ),
    );
  }
}