import 'package:flutter/material.dart';
import 'signupform_screen.dart';
import 'primary_button.dart';
import 'login_option.dart';
import 'login_form.dart';
import 'reset_password.dart';

const kDefaultPadding = EdgeInsets.symmetric(horizontal: 30);
const kPrimaryColor = Color(0xFF1B383A);
const kSecondaryColor = Color(0xFF59706F);
const kZambeziColor = Color(0xFF5B5B5B);




TextStyle textButton = TextStyle(
  color: kPrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
TextStyle titleText =
TextStyle(color: kPrimaryColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = TextStyle(
    color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
class LogInScreen extends StatelessWidget {

 final LogInFormState ani=new LogInFormState();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: kDefaultPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Welcome Back',
                  style: titleText,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'New to this app?',
                      style: subTitle,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpFormScreen(),
                            ));
                      },
                      child: Text(
                        'Sign Up',
                        style: textButton.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                LogInForm(),



                SizedBox(
                  height: 50,
                ),
                Text(
                  'Or log in with:',
                  style: subTitle.copyWith(color: Color(0xFF272726)),
                ),
                SizedBox(
                  height: 20,
                ),
                LoginOption(),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}