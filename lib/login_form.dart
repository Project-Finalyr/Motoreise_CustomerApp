import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motoreise_app/HomePage.dart';
import 'package:motoreise_app/authentications.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:motoreise_app/reset_password.dart';

const kTextFieldColor = Color(0xFF979797);
const kPrimaryColor = Color(0xFF1B383A);
const kSecondaryColor = Color(0xFF59706F);

class LogInForm extends StatefulWidget {
  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {

  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showCircular = false;

  Future<void> login() async{
    if (formkey.currentState.validate()) {

      formkey.currentState.save();
      setState(() {
        showCircular=true;
      });
      signin(email, password, context).then((value) async{

        if (value != null) {
          setState(() {
            showCircular=false;
          });
          FirebaseUser user = await FirebaseAuth.instance.currentUser();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(uid: user.uid,mail: user.email),
              ));

        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width * 0.90,
      child: Form(
        key: formkey,
        child: Column(

          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
              validator: MultiValidator([
                RequiredValidator(
                    errorText: "This Field Is Required"),
                EmailValidator(errorText: "Invalid Email Address"),
              ]),
              onChanged: (val) {
                email = val;
              },
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"),
                validator: MultiValidator([
                  RequiredValidator(
                      errorText: "Password Is Required"),
                  MinLengthValidator(6,
                      errorText: "Minimum 6 Characters Required"),
                ]),
                onChanged: (val) {
                  password = val;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen()));
              },
              child: Align(
                child: Text(
                  'Reset Password?',
                  style: TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            showCircular ? CircularProgressIndicator() : SizedBox(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 50.0,
                width: 250.0,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.orange,
                  onPressed: (){
                   login();
                  },
                  child: Text('Login',style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,

                  ),),
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

}