import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/data/model/model_task.dart';
import 'package:task_management_app/app/data/services/service_task.dart';
import 'package:task_management_app/theme/app_theme.dart';

class HomeController extends GetxController {
  // text editing add task
  TextEditingController? titleController;
  TextEditingController? descriptionController;

  // text editing edit task
  TextEditingController? titleEditController;
  TextEditingController? descriptionEditController;

  // inject sqlite
  final ServiceTask _serviceTask;

  HomeController(this._serviceTask);

  var isLoading = false.obs;

  var message = ''.obs;
  var taskList = <ModelTask>[].obs;
  var displayTask = <ModelTask>[].obs; // untuk pencarian
  var task = Rxn<ModelTask>();

  final RxBool isSelected = false.obs;

  // ubah tema
  final RxBool themeMode = false.obs;
  ThemeData get themeData =>
      themeMode.value ? DarkTheme.darkThemeData : LightTheme.lightThemeData;

  void toggleTheme(bool isDark) {
    themeMode.value = isDark;
  }

  @override
  void onInit() {
    super.onInit();
    loadAllTaskValue();
    // add task
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    // edit task
    titleEditController = TextEditingController();
    descriptionEditController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // add task
    titleController?.dispose();
    descriptionController?.dispose();
    // edit task
    titleEditController?.dispose();
    descriptionEditController?.dispose();
  }

  // create task
  Future<void> saveTaskValue() async {
    if (titleController!.text.isEmpty || descriptionController!.text.isEmpty) {
      message.value = "Title and description cannot be empty";
      return;
    }

    isLoading.value = true;
    try {
      final result = await _serviceTask.insertItem(
          titleController!.text, descriptionController!.text);
      if (result == 0) {
        message.value = "Failed to save your data";
        print('Gagal');
      } else {
        message.value = "Your data is saved";
        await loadAllTaskValue();
        Get.back();
        print('Berhasil');
        // Get.close(1);
      }
    } catch (e) {
      message.value = "Error failed to save your data";
      print('error $e');
    } finally {
      isLoading.value = false;
    }
  }

  // function to read all task values
  Future<void> loadAllTaskValue() async {
    isLoading.value = true;
    try {
      displayTask.value = await _serviceTask.getAllItems();
      message.value = "All of your data is loaded";
      print('Success Get Data : ${displayTask[0].id}');
    } catch (e) {
      message.value = "Failed to load your all data";
      print('Error Get Data : $e');
    } finally {
      isLoading.value = false;
    }
  }

  // function to update task value by ID
  Future<void> updateTaskById(int id) async {
    try {
      final result = await _serviceTask.updateItem(
          id, titleEditController!.text, descriptionEditController!.text);
      if (result == 0) {
        message.value = "Failed to update your data";
      } else {
        message.value = "Your data is updated";
        await loadAllTaskValue();
        Get.offNamed('/home');
      }
    } catch (e) {
      message.value = "Error failed to update your data";
    }
  }

  // function to delete task value by ID
  Future<void> deleteTaskById(int id) async {
    try {
      await _serviceTask.removeItem(id);
      await loadAllTaskValue();
      Get.back();
      message.value = "Your data is removed";
    } catch (e) {
      message.value = "Failed to remove your data";
    }
  }
}