
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task2/model/contact.dart';

class ContactListController extends StateNotifier<List<Contact>> {

  ContactListController() : super([]);



  addContact(Contact contacts) {

    state = [contacts, ...state];

    //...state - existing state + new added contacts

  }

}