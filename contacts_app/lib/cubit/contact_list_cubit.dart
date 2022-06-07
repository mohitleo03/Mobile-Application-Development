import 'package:contacts_app/cubit/contact_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/contact.dart';

class ContactListCubit extends Cubit<ContactListState> {
  ContactListCubit(ContactListState initialState) : super(initialState);
  add(Contact Contact) {
    state.ContactList.add(Contact);
    emit(ContactListState(state.ContactList));
  }
}
