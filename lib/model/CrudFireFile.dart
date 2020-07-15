import 'package:cloud_firestore/cloud_firestore.dart';

class CrudFire
  {
  final MedicalCenterList = Firestore.instance.collection('medicalecenter');
  final DonnerList = Firestore.instance.collection('user');
  final RequestColl = Firestore.instance.collection('Requeste');
  Future<void> Creatuser(data) async{
    DonnerList.add(data);
  }
  Future<void> Creatcenter(data) async{
    MedicalCenterList.add(data);
  }
  Future<void> CreatRequeste(data) async{
   RequestColl.add(data);
  }
  getData() async{
    await Firestore.instance.collection('books').getDocuments();
  }
  void getDataref() {
    Firestore.instance
        .collection("user")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }
  }