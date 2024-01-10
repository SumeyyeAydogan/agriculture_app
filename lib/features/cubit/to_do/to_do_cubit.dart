import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/widget/custom_search_delegate.dart';
import '../../model/to_do/task_model.dart';
import 'to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit(super.initialState);

  late List<TaskModel>? allTasks = <TaskModel>[];
  DateTime initialDate = DateTime.now();
  List<int>? keys = [];

  setDate(BuildContext context, value) {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time) async {
      DateTime selectedDate =
          DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time!.hour, time.minute);
      var newAddedTask = TaskModel.create(
        name: value,
        createdAt: selectedDate.toUtc(),
      );
      emit(SetDateState(selectedDate, newAddedTask));
    });
  }

  addTask(String value, DateTime? date) async {
    var newAddedTask = TaskModel.create(name: value, createdAt: date);
    allTasks!.insert(0, newAddedTask);
    emit(AddedTaskState(newAddedTask));
  }

  setName(String newValue, TaskModel task) {
    task.name = newValue;
    emit(SetNameState(newValue));
  }

  setCompleted(TaskModel task) async {
    task.isCompleted = !task.isCompleted;
    emit(SetCompletedState(task.isCompleted));
  }

  deleteTask(TaskModel task, int currentListIndex) async {
    allTasks!.removeAt(currentListIndex);
    emit(DeleteTaskState(task.id));
  }

  void showSearchDelegate(BuildContext context) {
    showSearch(context: context, delegate: CustomSearchDelegate());
  }
}
