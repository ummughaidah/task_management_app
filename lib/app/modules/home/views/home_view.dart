import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/modules/home/views/create_edit_task_view.dart';
import 'package:task_management_app/app/modules/home/views/task_detail_view.dart';
import 'package:task_management_app/app/widget/card_task_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task List Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Obx(
            () => CupertinoSwitch(
              activeColor: Colors.purple.shade100,
              focusColor: Colors.purple.shade100,
              value: controller.themeMode.value,
              onChanged: (bool? value) {
                // controller.themeMode.value = value!;
                controller.toggleTheme(value!);
              },
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(24),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width >= 600 ? 6 : 2,
                  ),
                  itemCount: controller.displayTask.length,
                  itemBuilder: (BuildContext context, int index) {
                    final task = controller.displayTask[index];
                    return CardTaskWidget(
                      onTap: () {
                        Get.to(() => const TaskDetailView(), arguments: {
                          'id': task.id,
                          'title': task.title,
                          'description': task.description,
                          'select': task.isSelected.value
                        });
                      },
                      value: task.isSelected.value,
                      onChanged: (bool? value) {
                        task.isSelected.value = value!;
                        controller.updateTaskSelection(task.id!, value);
                      },
                      title: task.title,
                      description: task.description,
                      onEdit: () {
                        Get.to(() => const CreateEditTaskView(), arguments: {
                          'id': task.id,
                          'title': task.title,
                          'description': task.description,
                        });
                      },
                    );
                  },
                ),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateEditTaskView());
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
