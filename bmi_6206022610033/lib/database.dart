import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String Name, String Sex, String Age, String Height,
      String Weigth, String BMI, String Date) async {
    try {
      await firestore.collection("BMI").add({
        'Name': Name,
        'Sex': Sex,
        'Age': Age,
        'Height': Height,
        'Weight': Weigth,
        'BMI': BMI,
        'Date': Date
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("BMI").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('BMI').orderBy('Date').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "Name": doc['Name'],
            "Age": doc["Age"],
            "Sex": doc["Sex"],
            'Height': doc['Height'],
            'Weight': doc['Weight'],
            'BMI': doc['BMI'],
            'Date': doc['Date']
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String Name, String Sex, String Age,
      String Height, String Weigth, String BMI, String Date) async {
    try {
      await firestore.collection("BMI").doc(id).update({
        'Name': Name,
        'Sex': Sex,
        'Age': Age,
        'Height': Height,
        'Weight': Weigth,
        'BMI': BMI,
        'Date': Date
      });
    } catch (e) {
      print(e);
    }
  }
}
