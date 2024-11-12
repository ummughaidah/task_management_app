import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:task_management_app/app/modules/home/views/create_edit_task_view.dart';
import 'package:task_management_app/app/widget/item_detail_widget.dart';

class TaskDetailView extends GetView<HomeController> {
  const TaskDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final task = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            task['title'],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.chevron_left)),
          actions: [
            IconButton(
                onPressed: () {
                  controller.deleteTaskById(task['id']);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ItemDetailWidget(
              status: task['select'] == false ? 'Complete' : 'Uncomplete',
              description: task['description']),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const CreateEditTaskView(), arguments: {
              'id': task['id'],
              'title': task['title'],
              'description': task['description']
            });
          },
          tooltip: 'Edit Task',
          child: const Icon(Icons.edit),
        ));
  }
}
