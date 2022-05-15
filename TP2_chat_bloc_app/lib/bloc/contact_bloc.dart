
import 'package:chat_bloc_app/bloc/contact_event.dart';
import 'package:chat_bloc_app/bloc/contact_state.dart';
import 'package:chat_bloc_app/model/contact_model.dart';
import 'package:chat_bloc_app/repository/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState>{

  ContactRepository contactRepository;
  String lastEvent = "";

  //Constructor
  ContactBloc(ContactState contactState, this.contactRepository):super(contactState){
    //Traiter les evenements
    on<ContactEvent>((event, emit) async{
      if(event is LoadAllContactsEvent){
        lastEvent="All";
        //State1 :
        emit(ContactState(contacts: [], requestState: RequestState.Loading,errorMessage:""));
        try{
          List<Contact> contacts = await contactRepository.allContacts();
          //State2 :
          emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errorMessage:""));
        }catch(e){
          emit(ContactState(contacts:[] , requestState:RequestState.Error ,errorMessage:e.toString()));
        }

      }else if(event is LoadBDCCContactsEvent){
        lastEvent="BDCC";
        emit(ContactState(contacts: [], requestState: RequestState.Loading,errorMessage:""));
        try{
          List<Contact> contacts = await contactRepository.contactByGroup("BDCC");
          emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errorMessage:""));
        }catch(e){
          emit(ContactState(contacts:[] , requestState:RequestState.Error ,errorMessage:e.toString()));
        }
        List<Contact> contacts = await contactRepository.contactByGroup("BDCC");
        emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errorMessage:""));
      }else if(event is LoadGLSIDContactsEvent){
        lastEvent="GLSID";
        emit(ContactState(contacts: [], requestState: RequestState.Loading,errorMessage:""));
        try{
          List<Contact> contacts = await contactRepository.contactByGroup("GLSID");
          emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errorMessage:""));
        }catch(e){
          emit(ContactState(contacts:[] , requestState:RequestState.Error ,errorMessage:e.toString()));
        }

      }
      });
  }


}