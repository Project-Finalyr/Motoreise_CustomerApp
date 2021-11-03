import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


//FirebaseAuth auth = FirebaseAuth.instance;
//
//
//// a simple dialog to be visible everytime some error occurs
//showErrDialog(BuildContext context, String err) {
//  // to hide the keyboard, if it is still
//  FocusScope.of(context).requestFocus(new FocusNode());
//  return showDialog(
//    context: context,
//    child: AlertDialog(
//      title: Text("Error"),
//      content: Text(err),
//      actions: <Widget>[
//        OutlineButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text("Ok"),
//        ),
//      ],
//    ),
//  );
//}
//
//
//
//// instead of returning true or false
//// returning user to directly access UserID
////SignIn Function
//Future<User> signin(
//    String email, String password, BuildContext context) async {
//  try {
//    User result =
//    (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
//
//    return Future.value(result);
//  } catch (e) {
//    // simply passing error code as a message
//    print(e.code);
//    switch (e.code) {
//      case 'ERROR_INVALID_EMAIL':
//        showErrDialog(context, e.code);
//        break;
//      case 'ERROR_WRONG_PASSWORD':
//        showErrDialog(context, e.code);
//        break;
//      case 'ERROR_USER_NOT_FOUND':
//        showErrDialog(context, e.code);
//        break;
//      case 'ERROR_USER_DISABLED':
//        showErrDialog(context, e.code);
//        break;
//      case 'ERROR_TOO_MANY_REQUESTS':
//        showErrDialog(context, e.code);
//        break;
//      case 'ERROR_OPERATION_NOT_ALLOWED':
//        showErrDialog(context, e.code);
//        break;
//    }
//    // since we are not actually continuing after displaying errors
//    // the false value will not be returned
//    // hence we don't have to check the valur returned in from the signin function
//    // whenever we call it anywhere
//    return Future.value(null);
//  }
//}
//
//// change to Future<FirebaseUser> for returning a user
//Future<User> signUp(
//    String email, String password, BuildContext context) async {
//  try {
//    User result = (await auth.createUserWithEmailAndPassword(
//        email: email, password: email)).user;
//
//    // create a new document for the user with the uid
//    //await DatabaseService(uid: user.uid).updateUserData('0','new crew member', 100);
//    return Future.value(result);
//
//  } catch (error) {
//    switch (error.code) {
//      case 'ERROR_EMAIL_ALREADY_IN_USE':
//        showErrDialog(context, "Email Already Exists");
//        break;
//      case 'ERROR_INVALID_EMAIL':
//        showErrDialog(context, "Invalid Email Address");
//        break;
//      case 'ERROR_WEAK_PASSWORD':
//        showErrDialog(context, "Please Choose a stronger password");
//        break;
//    }
//    return Future.value(null);
//  }
//}
//
//Future<bool> signOutUser() async {
//  User user = await auth.currentUser;
//  print(user.providerData[1].providerId);
////  if (user.providerData[1].providerId == 'google.com') {
////    await gooleSignIn.disconnect();
////  }
//  await auth.signOut();
//  return Future.value(true);
//}
//
////Current UID
//Future<String> getCurrentUID() async{
//  return   (await auth.currentUser).uid;
//
//}
FirebaseAuth auth = FirebaseAuth.instance;
//final gooleSignIn = GoogleSignIn();

// a simple dialog to be visible everytime some error occurs
showErrDialog(BuildContext context, String err) {
  // to hide the keyboard, if it is still
  FocusScope.of(context).requestFocus(new FocusNode());
  return showDialog(
    context: context,
    child: AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Ok"),
        ),
      ],
    ),
  );
}

//SignIn Function
Future<FirebaseUser> signin(
    String email, String password, BuildContext context) async {
  try {
    AuthResult result =
    await auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return Future.value(user);
  } catch (e) {
    // simply passing error code as a message
    print(e.code);
    switch (e.code) {
      case 'ERROR_INVALID_EMAIL':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_WRONG_PASSWORD':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_USER_NOT_FOUND':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_USER_DISABLED':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        showErrDialog(context, e.code);
        break;
    }
    // since we are not actually continuing after displaying errors
    // the false value will not be returned
    // hence we don't have to check the valur returned in from the signin function
    // whenever we call it anywhere
    return Future.value(null);
  }
}

// change to Future<FirebaseUser> for returning a user
Future<FirebaseUser> signUp(
    String email, String password, BuildContext context) async {
  try {
    AuthResult result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    // create a new document for the user with the uid
    //await DatabaseService(uid: user.uid).updateUserData('0','new crew member', 100);
    return Future.value(user);

  } catch (error) {
    switch (error.code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        showErrDialog(context, "Email Already Exists");
        break;
      case 'ERROR_INVALID_EMAIL':
        showErrDialog(context, "Invalid Email Address");
        break;
      case 'ERROR_WEAK_PASSWORD':
        showErrDialog(context, "Please Choose a stronger password");
        break;
    }
    return Future.value(null);
  }
}

Future<bool> signOutUser() async {
  FirebaseUser user = await auth.currentUser();
  print(user.providerData[1].providerId);

  await auth.signOut();
  return Future.value(true);
}

//Current UID
Future<String> getCurrentUID() async{
  return   (await auth.currentUser()).uid;

}

