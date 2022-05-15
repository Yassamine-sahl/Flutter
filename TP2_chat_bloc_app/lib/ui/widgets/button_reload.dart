import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact_bloc.dart';
import '../../bloc/contact_event.dart';

class ButtonReload extends StatelessWidget {
  const ButtonReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          ContactBloc contactBloc = context.read<ContactBloc>();
          if(contactBloc.lastEvent== "All"){
            context.read<ContactBloc>().add(LoadAllContactsEvent());
          }else if (contactBloc.lastEvent== "BDCC"){
            context.read<ContactBloc>().add(LoadBDCCContactsEvent());
          }else if (contactBloc.lastEvent== "GLSID"){
            context.read<ContactBloc>().add(LoadGLSIDContactsEvent());
          }
        },
        child: Text("Reload")
    );
  }
}
