import 'package:contacts_app/cubit/contact_list_cubit.dart';
import 'package:contacts_app/cubit/contact_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactListCubit, ContactListState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
          color: Colors.white,
          child: ListView.builder(
            itemCount: state.ContactList.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: CircleAvatar(backgroundColor: Colors.grey.shade700,child: Icon(Icons.person,color: Colors.white,),),
                title: Text(state.ContactList[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:Colors.grey.shade700 ),),
                subtitle: Text(state.ContactList[index].number.toString()),
              );

          }),
        );
      },
    );
  }
}
