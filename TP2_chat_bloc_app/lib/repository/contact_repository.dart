import 'dart:math';

import 'package:chat_bloc_app/model/contact_model.dart';

class ContactRepository {
  //Les donnes
  List<Contact> contacts = [
    Contact(id: 1, name: "Ahmed", groupe: "GLSID", profile: "AH"),
    Contact(id: 2, name: "Yaasmin", groupe: "GLSID", profile: "YA"),
    Contact(id: 3, name: "Oumaima", groupe: "GLSID", profile: "OUM"),
    Contact(id: 4, name: "Houda", groupe: "BDCC", profile: "HOU"),
    Contact(id: 5, name: "Akram", groupe: "BDCC", profile: "AK"),
    Contact(id: 6, name: "Ali", groupe: "BDCC", profile: "AL"),
  ];

  //Methode1
  Future<List<Contact>> allContacts() async{
      var future = await Future.delayed(Duration(seconds: 1));
      int rand= new Random().nextInt(10);
      if(rand>2){
        return contacts;
      }else{
        throw Exception("Erreur de chargement des contacts");
      }

  }

  //Methode2
  Future<List<Contact>> contactByGroup(String group) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rand= new Random().nextInt(10);
    if(rand>2){
      return contacts.where((element) => element.groupe==group).toList();
    }else{
      throw Exception("Erreur de chargement des contacts");
    }

  }
}











