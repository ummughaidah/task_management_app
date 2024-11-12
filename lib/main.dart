import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:task_management_app/app/data/services/service_task.dart';
import 'package:task_management_app/app/modules/home/controllers/home_controller.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  // inisialisasi sqlite service dan depedency injection
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // Inject ServiceTask agar bisa digunakan di seluruh aplikasi
  Get.put(ServiceTask(), permanent: true);

  final ServiceTask serviceTask = Get.find<ServiceTask>();

  // home controller
  final HomeController themeController = Get.put(HomeController(serviceTask));

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Management",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: themeController.themeData,
    ),
  );
}
