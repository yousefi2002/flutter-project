import 'dart:io';

Map<String, String> contact = {};
void main() {
  print('''
   Contact List Application
1) Add Contact
2) Delete Contact
3) Edit Contact
4) Display Contact
5) Exit  ''');
  stdout.write("Option: ");
  int generalOption = int.parse(stdin.readLineSync()!);

  while (generalOption != 5) {
    switch (generalOption) {
      case 1:
        print("Enter the information of the person you want to add.");
        addContacts();
        print('<--------------------------------------->');
        print('''
   Contact List Application
1) Add Contact
2) Delete Contact
3) Edit Contact
4) Display Contact
5) Exit  ''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);
      case 2:
        removeContacts();
        print('<--------------------------------------->');
        print('''
   Contact List Application
1) Add Contact
2) Delete Contact
3) Edit Contact
4) Display Contact
5) Exit  ''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);

      case 3:
        editeContacts();
        print('<--------------------------------------->');
        print('''
   Contact List Application
1) Add Contact
2) Delete Contact
3) Edit Contact
4) Display Contact
5) Exit  ''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);
      case 4:
        displayContacts();
        print('<--------------------------------------->');
        print('''
   Contact List Application
1) Add Contact
2) Delete Contact
3) Edit Contact
4) Display Contact
5) Exit  ''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);
    }
  }
  print("Exitting");
  print("<---------------------------------------->");
}

addContacts() {
  stdout.write("Contact Name: ");
  var name = stdin.readLineSync()!.toLowerCase();
  stdout.write("Contact Number: ");
  var number = stdin.readLineSync()!;
  contact.addAll({name.toLowerCase(): number.toLowerCase()});
  print("Contact number of ${name.toUpperCase()} is saved successfully");
}

removeContacts() {
  stdout.write("Enter contact's name who you want to delete his/her number: ");
  var name = stdin.readLineSync()!.toLowerCase();
  bool contactExist = contact.containsKey(name);
  if (contactExist) {
    contact.remove(name);
    print("Contact number of ${name.toUpperCase()} is deleted successfully");
  } else {
    print(
        "The contact number of the person you have mentioned does not exist.");
  }
}

editeContacts() {
  stdout
      .write("Enter contact's name who you want to edit his/her information: ");
  var oldName = stdin.readLineSync()!.toLowerCase();
  bool contactExist = contact.containsKey(oldName);
  if (contactExist) {
    contact.remove(oldName);
    stdout.write("Contact's Name: ");
    var newName = stdin.readLineSync()!.toLowerCase();
    stdout.write("Contact's Number: ");
    var newNumber = stdin.readLineSync()!;
    contact[newName] = newNumber;
    print("Contact number of ${newName.toUpperCase()} is edited successfully");
  } else {
    print(
        "The contact number of the person you have mentioned does not exist.");
  }
}

displayContacts() {
  print("""
<----- Enter ----->
<1> To see all contacts.
<2> To see a spesific contac""");
  stdout.write("Option: ");
  int choose = int.parse(stdin.readLineSync()!);
  var name;
  switch (choose) {
    case 1:
      if (contact.isEmpty) {
        print("The contact list is emty");
      } else {
        print("<----- CONTACTS ----->");

        contact.forEach((name, number) {
          print("${name.toUpperCase()}: $number");
        });
      }
    case 2:
      stdout.write("Enter contact's name who you want to see his/her number: ");
      name = stdin.readLineSync()!.toLowerCase();
      bool contactExist = contact.containsKey(name);
      if (contactExist) {
        print(" ${name.toUpperCase()}: ${contact[name]}");
      } else {
        print("The contact name you have mentioned does not exist.");
      }
  }
}
