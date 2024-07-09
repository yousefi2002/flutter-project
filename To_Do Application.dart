import 'dart:io';

void main() {
  print("<---------------------------------------->");
  stdout.write('''
TO_DO APPLICATION
1. Adding Task
2. Removing Task
3. view Tasks
4. Exit
''');
  stdout.write("Option: ");
  String choice = stdin.readLineSync()!;
  while (choice != "4") {
    switch (choice) {
      case "1":
        print('Add your task');
        String job = stdin.readLineSync()!.toLowerCase();
        task.add(job);
        print("Taske got added.");
        print("<---------------------------------------->");
        stdout.write('''
TO_DO APPLICATION
1. Adding Task
2. Removing Task
3. view Tasks
4. Exit
''');
        stdout.write("Option: ");
        choice = stdin.readLineSync().toString();
      //...............................................
      case "2":
        if (task.isEmpty) {
          print("There is no task to remove.");
          print("<---------------------------------------->");
          stdout.write('''
TO_DO APPLICATION
1. Adding Task
2. Removing Task
3. view Tasks
4. Exit
''');
          stdout.write("Option: ");
          choice = stdin.readLineSync()!;
        } else {
          print('Print your task.');
          String removeTask = stdin.readLineSync()!.toLowerCase();
          if (!(task.contains(removeTask))) {
            print("This task does not exist.");
            print("<---------------------------------------->");
            stdout.write('''
TO_DO APPLICATION
1. Adding Task
2. Removing Task
3. view Tasks
4. Exit
''');
            stdout.write("Option: ");
            choice = stdin.readLineSync()!;
          } else {
            removeFromList(removeTask);
            print("Task got removed.");
            print("<---------------------------------------->");
            stdout.write('''
TO_DO APPLICATION
1. Adding Task
2. Removing Task
3. view Tasks
4. Exit
''');
            stdout.write("Option: ");
            choice = stdin.readLineSync().toString();
          }
        }

      //..................................
      case "3":
        if (task.isEmpty) {
          print('No Task');
          print("<---------------------------------------->");
          stdout.write('''
TO_DO APPLICATION
1. Adding Task
2. Removing Task
3. view Tasks
4. Exit
''');
          stdout.write("Option: ");
          choice = stdin.readLineSync().toString();
        } else {
          viewList();
          print("<---------------------------------------->");
          stdout.write('''
TO_DO APPLICATION
1. Adding Task
2. Removing Task
3. view Tasks
4. Exit
''');
          stdout.write("Option: ");
          choice = stdin.readLineSync().toString();
        }
    }
  }
  print("Exitting");
  print("<---------------------------------------->");
}

List<dynamic> task = [];

addToList(var value) {
  print("Add your task");
  task.add(value);
  print("Your task : $task ADDED");
}

removeFromList(var value) {
  task.remove(value);
}

viewList() {
  for (int i = 0; i < task.length; i++) {
    print("Task ${i + 1}: ${task[i]}");
  }
}
