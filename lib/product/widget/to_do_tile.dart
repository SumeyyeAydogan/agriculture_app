/* import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_with_cubit/core/extension/context_extension.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text("title"),
          Spacer(),
          IconButton(onPressed: (){}, icon: const Icon(Icons.check), color: Colors.green,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.book)),
        ],
      ),
      subtitle: Padding(padding: context.paddingExtraLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("hi"),
          Text(
            DateFormat.yMMMEd().format(DateTime.now()),
          )
        ],
      ),
      ),
    );
  }
} */

//Dateli kod