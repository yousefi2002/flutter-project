import 'dart:io';

void main() {
  Library library = Library();
  print('''
  Welcome to our library
1) Add Member
2) Delete Member
3) Edit Member
4) Display Member
5) Exit ''');
  stdout.write("Option: ");
  int generalOption = int.parse(stdin.readLineSync()!);
  while (generalOption != 5) {
    switch (generalOption) {
      case 1:
        library.addMember();
        print('<--------------------------------------->');
        print('''
1) Add Member
2) Delete Member
3) Edit Member
4) Display Member
5) Exit
''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);
      case 2:
        
        library.deleteMember();
        print('<--------------------------------------->');
        print('''
1) Add Member
2) Delete Member
3) Edit Member
4) Display Member
5) Exit ''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);

      case 3:
        library.editMembers();
        print('<--------------------------------------->');
        print('''
1) Add Member
2) Delete Member
3) Edit Member
4) Display Member
5) Exit ''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);
      case 4:
        library.displayMembers();
        print('<--------------------------------------->');
        print('''
1) Add Member
2) Delete Member
3) Edit Member
4) Display Member
5) Exit ''');
        stdout.write("Option: ");
        generalOption = int.parse(stdin.readLineSync()!);
      // default:
      //   print("You have entered a wrong digit.");
      //   break;
    }
  }
  print("Exitting");
        print("<---------------------------------------->");
}

class Member {
  var id;
  var name;
  var gender;
  var age;

  Member(this.id, this.name, this.gender, this.age);

  String toString() {
    return "\nId: $id\nName: $name\nGender: $gender\nAge: $age";
  }
}

class Library {
  List<Member> members = [];

  addMember() {
    stdout.write("ID: ");
    var id = (stdin.readLineSync()!);
    stdout.write("Name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Gender: ");
    String gender = stdin.readLineSync()!;
    stdout.write("Age: ");
    int age = int.parse(stdin.readLineSync()!);
    members.add(Member(id, name, gender, age));
    print('<< Member added successfully >>');
  }

  deleteMember() {
    print('Enter id of the member that you want to delete it');
    stdout.write("ID: ");
    var id = (stdin.readLineSync()!);
    bool memberExist = members.any((member) => member.id == id);
    if (memberExist) {
      members.removeWhere((member) => member.id == id);
      print('<< Member deleted successfully >>');
    } else {
      print("The member you have mentioned, does not exist.");
    }
  }

  editMembers() {
    print('Enter id of the member that you want to edit his/her information');
    stdout.write("ID: ");
    var id = (stdin.readLineSync()!);
    bool memberExist = members.any((member) => member.id == id);
    if (memberExist) {
      Member? member = members.firstWhere((member) => member.id == id);
      stdout.write("Name: ");
      member.name = stdin.readLineSync()!;
      stdout.write("Gender: ");
      member.gender = stdin.readLineSync()!;
      stdout.write("Age: ");
      member.age = int.parse(stdin.readLineSync()!);
       print('<< Member\'s information edited successfully >>');

    } else {
      print("The member you have mentioned, does not exist.");
    }
  }

  displayMembers() {
    print('''
        <----- Enter ----->
    <1> For Displaying All Members.
    <2> For  Displaying A Specific Member.''');
    stdout.write('Option: ');
    int option = int.parse(stdin.readLineSync()!);
    switch (option) {
      case 1:
        if (members.isEmpty) {
          print("This library does not have any member");
        } else {
          for (int i = 0; i < members.length; i++) {
            print("\nMember ${i + 1}>> ${members[i]}\n");
          }
        }
      case 2:
        print('Enter id of the member that you want to display it');
        stdout.write("ID: ");
        var id = (stdin.readLineSync()!);
        bool memberExist = members.any((member) => member.id == id);

        if (memberExist) {
          print(members.where((member) => member.id == id));
        } else {
          print("This member does not exsist.");
        }
    }
  }
}
