import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:task_management_app/app/widget/item_ce_widget.dart';

class CreateEditTaskView extends GetView<HomeController> {
  const CreateEditTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    final task = Get.arguments;

    // Initialize edit controllers if in edit mode
    if (task != null) {
      controller.titleEditController = TextEditingController(text: task['title']);
      controller.descriptionEditController = TextEditingController(text: task['description']);
    }

    return Scaffold(
        appBar: AppBar(
          title: task != null
              ? const Text('Edit Task')
              : const Text('Create Task'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: task != null
                ? ItemCEWidget(
                    controllerTitle: controller.titleEditController!,
                    controllerDescription:
                        controller.descriptionEditController!,
                    onPressed: () {
                      controller.updateTaskById(task['id']);
                    },
                  )
                : ItemCEWidget(
                    controllerTitle: controller.titleController!,
                    controllerDescription: controller.descriptionController!,
                    onPressed: () {
                      controller.saveTaskValue();
                    },
                  )));
  }
}
