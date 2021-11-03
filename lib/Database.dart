import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('Customers');

  Future<void> updateUserData(String firstname, String lastname,String Email) async {
    return await brewCollection.document(uid).setData({
      'firstname': firstname,
      'lastname': lastname,
      'Email':Email,



    });
  }

}
