import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motoreise_app/login_screen.dart';
import 'package:motoreise_app/signupform_screen.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Center(
          child: SingleChildScrollView(
            child: Column(
             children: <Widget>[
              SizedBox(height: 30.0),

             Align(
               child: Center(
                 child: Image.asset('assets/logo copy.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                   //width: MediaQuery.of(context).size.width * 0.25,
                 ),
               ),
               alignment: Alignment.topCenter,
             ),
             SizedBox(height: 15,),

               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                 child: Align(
                   alignment: Alignment.topCenter,
                   child: Text(
                     "Already have an account?",
                     style: TextStyle(
                       color: Colors.black54,
                       fontSize: 18.0,
                         fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
               ),

               SizedBox(height: 10.0),

               Center(
                 child: Container(
                   height: 45.0,
                   width: 220.0,
                   child: FloatingActionButton(
                     heroTag: "btn1",
                     backgroundColor: Colors.orange,
                     onPressed: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => LogInScreen(),)
                       );
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

               SizedBox(height: 30.0),

               Row(children: <Widget>[
                 Expanded(
                   child: new Container(
                       margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                       child: Divider(
                         color: Colors.black,
                         height: 30,
                       )),
                 ),
                 Text(" Or sign up with ",
                 style: TextStyle(
                   color: Colors.black54,
                   fontSize: 18.0,
                   fontWeight: FontWeight.bold
                 ),
                 ),
                 Expanded(
                   child: new Container(
                       margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                       child: Divider(
                         color: Colors.black,
                         height: 30,
                       )),
                 ),
               ]),

               SizedBox(height: 30,),
               Center(
                 child: Container(
                   height: 45.0,
                   width: 190.0,
                   child: FloatingActionButton.extended(
                     heroTag: "btn2",
                     elevation: 0.5,
                     backgroundColor: Colors.white,

                     //onPressed: (){},

                     shape: RoundedRectangleBorder(
                         side: BorderSide(color: Colors.black, width: 1.0),
                         borderRadius: BorderRadius.all(Radius.circular(15.0)),

                     ),
                     icon: Align(
                       child: FaIcon(FontAwesomeIcons.facebook,color: Colors.blue,size: 25),
                       alignment: Alignment.centerLeft,
                     ),
                     label: Center(
                       child: Row(
                         children: <Widget>[
                           SizedBox(width: 30.0,),
                           Center(
                             child: Text('Facebook',
                               style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 15,
                               ),),
                           ),


                         ],
                       ),
                     ),

                   ),
                 ),
               ),
               SizedBox(height: 15,),
               Center(
                 child: Container(
                   height: 45.0,
                   width: 190.0,
                   child: FloatingActionButton.extended(
                     heroTag: "btn3",
                     elevation: 0.5,
                     backgroundColor: Colors.white,

                     //onPressed: (){},

                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.black, width: 1.0),
                       borderRadius: BorderRadius.all(Radius.circular(15.0)),

                     ),

                     icon: Align(
                       child: FaIcon(FontAwesomeIcons.google,color: Colors.orange,size: 25),
                       alignment: Alignment.centerLeft,
                     ),
                     label: Center(
                       child: Row(
                         children: <Widget>[

                           SizedBox(width: 45.0,),
                           Center(
                             child: Text('Google',
                               style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 15,
                               ),),
                           ),


                         ],
                       ),
                     ),


                   ),
                 ),
               ),
               SizedBox(height: 15,),
               Center(
                 child: Container(
                   height: 45.0,
                   width: 190.0,
                   child: FloatingActionButton.extended(
                     heroTag: "btn4",
                     elevation: 0.5,
                     backgroundColor: Colors.white,

                     //onPressed: (){},

                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.black, width: 1.0),
                       borderRadius: BorderRadius.all(Radius.circular(15.0)),

                     ),

                     icon: Align(
                       child: FaIcon(FontAwesomeIcons.apple,color: Colors.grey,size: 25),
                       alignment: Alignment.centerLeft,
                     ),
                     label: Center(
                       child: Row(
                         children: <Widget>[

                           SizedBox(width: 55.0,),
                           Center(
                             child: Text('Apple',
                               style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 15,
                               ),),
                           ),


                         ],
                       ),
                     ),

                   ),
                 ),
               ),
               SizedBox(height: 15,),
               Center(
                 child: Container(
                   height: 45.0,
                   width: 190.0,
                   child: FloatingActionButton.extended(
                     heroTag: "btn5",
                     elevation: 0.5,
                     backgroundColor: Colors.white,

                     onPressed: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => SignUpFormScreen(),)
                       );
                     },

                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.black, width: 1.0),
                       borderRadius: BorderRadius.all(Radius.circular(15.0)),

                     ),
                     icon: Align(
                         child: FaIcon(FontAwesomeIcons.mailBulk,color: Colors.black,size: 25),
                       alignment: Alignment.centerLeft,
                     ),
                     label: Center(
                       child: Row(
                         children: <Widget>[

                           SizedBox(width: 55.0,),
                           Center(
                             child: Text('Email',
                               style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 15,
                               ),),
                           ),


                         ],
                       ),
                     ),

                   ),
                 ),
               ),
               SizedBox(height: 40,),
               Center(
                 child: Text('By signing up you agree to our\nTerms of Service and Privacy policy',
                 style: TextStyle(
                   color: Colors.grey,
                   fontSize: 12.0,
                   fontWeight: FontWeight.bold
                 ),
                 ),
               ),
               SizedBox(height: 20,),

            ],
      ),
          ),

        ),

      ),
    );

  }
}
