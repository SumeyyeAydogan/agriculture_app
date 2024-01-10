import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../product/widget/task_item.dart';
import '../cubit/to_do/to_do_cubit.dart';
import '../cubit/to_do/to_do_state.dart';

class AllToDosPage extends StatelessWidget {
  const AllToDosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDoState>(
      listener: (context, state) {
        if (state is SetDateState) {
          if (state.initialDate != null) {
            context.read<ToDoCubit>().addTask(state.newAddedTask.name, state.initialDate);
          }
        }
        if (state is AddedTaskState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
            content: Text("Görev Eklendi!"),
            backgroundColor: Colors.greenAccent,
          ));
        }
      },
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var thisTask = context.read<ToDoCubit>().allTasks![index];
            return Dismissible(
              //yana kaydırınca silmek için
              background: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  )),
              key: UniqueKey(),
              onDismissed: (direction) {
                context.read<ToDoCubit>().deleteTask(thisTask, index);
              },
              child: TaskItem(
                  task: thisTask,
                  taskNameController: TextEditingController.fromValue(
                    TextEditingValue(text: thisTask.name),
                  )),
            );
          },
          itemCount: context.read<ToDoCubit>().allTasks!.length,
        );
      },
    );
  }
}
