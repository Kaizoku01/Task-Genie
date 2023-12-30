import 'package:flutter/material.dart';
import 'package:todoey/Screens/add_task_screen.dart';
import 'package:todoey/constants.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modals/task_data.dart';

import 'Widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,color: Colors.white,size: 28,),
        backgroundColor: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: kAddCardDecoration,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kListIcon,
                kHeadText,
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Task',
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: kCardDecoration,
              width: double.infinity,
              child: Provider.of<TaskData>(context).taskCount == 0 ? const Center(child: Text('No tasks to display')) : const TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
