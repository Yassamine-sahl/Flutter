import 'package:chat_bloc_app/bloc/contact_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactListView extends StatelessWidget {
  final ContactState state;
  const ContactListView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index)=>Divider(color: Colors.green, height: 3),
        itemCount: state.contacts.length,
        itemBuilder:(context,index){
          return ListTile(
            leading: CircleAvatar(child: Text("${state.contacts[index].profile}"),),
            title: Text(state.contacts[index].name),
          );
        }
    );
  }
}
