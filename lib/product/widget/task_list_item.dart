import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../features/cubit/to_do/to_do_cubit.dart';
import '../../features/cubit/to_do/to_do_state.dart';
import '../../features/model/to_do/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final TextEditingController taskNameController;
  const TaskItem(
      {Key? key, required this.task, required this.taskNameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        Future.microtask(() {
          taskNameController.text = task.name;
        }); //Futuremicrotask
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 10, //dağıtmaya yarıyor.
              ),
            ],
          ),
          child: ListTile(
            title: task.isCompleted
                ? Text(
                    task.name,
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  )
                : TextField(
                    controller: taskNameController,
                    minLines: 1,
                    maxLines: null,
                    textInputAction: TextInputAction.done, //klavyede tik işareti olmasını sağlar.
                    decoration: const InputDecoration(border: InputBorder.none),
                    onSubmitted: (newValue) async {
                      if (newValue.length > 3) {
                        context.read<ToDoCubit>().setName(newValue, task);
                        if (state is SetNameState) {
                          task.name = state.newName;
                        } else {
                          const SnackBar(content: Text("An error"));
                        }
                      }
                    },
                  ),
            leading: GestureDetector(
              onTap: () async {
                context.read<ToDoCubit>().setCompleted(task);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: task.isCompleted
                      ? Colors.green
                      : Colors.white, 
                  border: Border.all(color: Colors.grey, width: 0.8),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
            trailing: Text(
              DateFormat("hh: mm a").format(task.createdAt!),
            ),
          ),
        );
      },
    );
  }
}
