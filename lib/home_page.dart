import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Task {
  String name;
  DateTime dueDate;
  String priority;
  bool isCompleted;
  Task({
    required this.name,
    required this.dueDate,
    required this.priority,
    this.isCompleted = false,
  });
}
class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}
class _ToDoListState extends State<ToDoList> {
  TextEditingController taskController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String priority = 'High';
  List<Task> tasks = [];
  late SharedPreferences _prefs;
  int length=0;
  @override
  void initState() {
    super.initState();
    _loadTasks();
  }
  Future<void> _loadTasks() async {
    _prefs = await SharedPreferences.getInstance();
    final taskList = _prefs.getStringList('tasks');
    if (taskList != null) {
      setState(() {
        tasks = taskList.map((taskData) {
          final taskMap = jsonDecode(taskData);
          return Task(
            name: taskMap['name'],
            dueDate: DateTime.parse(taskMap['dueDate']),
            priority: taskMap['priority'],
            isCompleted: taskMap['isCompleted'],
          );
        }).toList();
      });
    }
  }
  Future<void> _saveTasks() async {
    final taskList = tasks.map((task) {
      return jsonEncode({
        'name': task.name,
        'dueDate': task.dueDate.toIso8601String(),
        'priority': task.priority,
        'isCompleted': task.isCompleted,
      });
    }).toList();
    await _prefs.setStringList('tasks', taskList);
  }
  Color getCardBackgroundColor(Task task) {
    final now = DateTime.now();
    if (task.dueDate != null && task.dueDate.isBefore(now)) {
      return Colors.red[100] ?? Colors.white;
    } else if (task.priority == 'High') {
      return Colors.blue[900] ?? Colors.white;
    } else if (task.priority == 'Medium') {
      return Colors.blue[300] ?? Colors.white;
    } else {
      return Colors.yellowAccent ?? Colors.white;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(top: 35.0,left: 25,right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 35,
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF7851A9),
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05,right: MediaQuery.of(context).size.width * 0.57),
            child: Text(
              'My ToDo',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.only(top: 1,right: 280),
            child: Text(
              '$length Tasks ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0,right: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 2, // Adjust the width to your preference
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.hardEdge,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(
                      Icons.list_alt,
                      size: 35,
                      color: Color(0xFF7851A9),
                    ),
                    hintText: "Search Task",
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                width: 375,
                height: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index){
                          final task = tasks[index];
                          final cardBackgroundColor = getCardBackgroundColor(task);
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFC4CBE7),
                                  blurRadius: 10,
                                  offset: Offset(5, 5),
                                ),
                              ],
                              color: cardBackgroundColor,
                            ),
                            child: GestureDetector(
                              onLongPress: (){
                                deleteTask(index);
                              },
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tasks[index].name,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      RichText(
                                        text: TextSpan(
                                          children:[
                                            TextSpan(
                                              text: 'Due:',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                                text: '  ${tasks[index].dueDate.toString()}',
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 20,
                                                )
                                            ),
                                            TextSpan(
                                              text: '\nPriority: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${tasks[index].priority}',
                                              style: TextStyle(
                                                color: Color(0xFF7851A9),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                          padding:EdgeInsets.only(left: 310.0,bottom: 1),
                                          child: CustomCheckbox(
                                            value: tasks[index].isCompleted,
                                            onChanged: (value) {
                                              setState(() {
                                                tasks[index].isCompleted = value;
                                              });
                                            },
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding:EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.006,left: MediaQuery.of(context).size.width * 0.58,right: MediaQuery.of(context).size.width * 0.04),
            child: GestureDetector(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (context)=>SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddTaskScreen(
                          addTask: addTask,
                        ),
                      ),
                    )
                );
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), // Shadow color
                      spreadRadius: 4, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 2), // Offset in the x, y direction
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'New Task',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4), // Shadow color
                            spreadRadius: 4, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: Offset(0, 2), // Offset in the x, y direction
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xFF7851A9),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void addTask(String taskss, DateTime dueDate, String priority){
    if (taskss.isNotEmpty) {
      final task = Task(
        name: taskss,
        dueDate: dueDate,
        priority: priority,
      );
      setState(() {
        tasks.add(task);
        _saveTasks();
        updateLength(); // Update the length
      });
      taskController.clear();
      dueDateController.clear();
    }
  }
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _saveTasks();
      updateLength(); // Update the length
    });
  }
  void updateLength() {
    setState(() {
      length = tasks.where((task) => !task.isCompleted).length;
    });
  }
}

class AddTaskScreen extends StatefulWidget {
  final Function addTask;
  AddTaskScreen({super.key, required this.addTask});
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}
class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String priority = 'High';
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 45),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2, // Adjust the width to your preference
                  ),
                ),
                child: Padding(
                  padding:EdgeInsets.only(left: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.task_alt,size: 28,color: Colors.pinkAccent,),
                        hintText: "Enter Task",
                        border: InputBorder.none, // Remove the default border
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2, // Adjust the width to your preference
                  ),
                ),
                child: Padding(
                  padding:EdgeInsets.only(left: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: TextField(
                      controller: dueDateController,
                      decoration: InputDecoration(
                        hintText: "Due Date",
                        suffixIcon: Icon(
                          Icons.date_range,
                          size: 28,
                          color: Colors.pinkAccent,
                        ),
                        border: InputBorder.none, // Remove the default border
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2, // Adjust the width to your preference
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:15,right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Priority: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      DropdownButton<String>(
                        value: priority,
                        onChanged: (String? newValue) {
                          setState(() {
                            priority = newValue!;
                          });
                        },
                        items: <String>['High', 'Medium', 'Low']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Icon(
                        Icons.priority_high,
                        size: 28,
                        color: Colors.pinkAccent,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 55),
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.0250),
                    ),
                    elevation: 8,
                    backgroundColor: Color(0xFF7851A9),
                  ),
                  onPressed: () {
                    addTask();
                  },
                  child: Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: MediaQuery.of(context).size.height * 0.0015,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      );
  }
  void addTask() {
    String task = taskController.text;
    String dueDateString = dueDateController.text;
    var dueDate = DateTime.tryParse(dueDateString);
    widget.addTask(task, dueDate, priority);
    setState(() {
      taskController.clear();
      dueDateController.clear();
    });
    Navigator.pop(context);
  }
}

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}
class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged(isChecked);
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey, width: 2),
          color: isChecked ? Colors.pink : Colors.white,
        ),
        child: Center(
          child: Icon(
            Icons.check,
            color: isChecked ? Colors.white : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
