import 'package:chat_bloc_app/bloc/contact_bloc.dart';
import 'package:chat_bloc_app/bloc/contact_state.dart';
import 'package:chat_bloc_app/repository/contact_repository.dart';
import 'package:chat_bloc_app/ui/pages/contacts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context)=>
                        ContactBloc(new ContactState(contacts: [],
                                                     requestState: RequestState.NONE,
                                                     errorMessage: ""),
                                    new ContactRepository()))  ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green
          ),
          routes: {
            "/contacts":(context)=>ContactPage(),
          },
          initialRoute: "/contacts",
        ));
  }





}







