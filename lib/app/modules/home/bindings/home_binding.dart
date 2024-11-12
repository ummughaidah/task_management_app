import 'package:get/get.dart';
import 'package:task_management_app/app/data/services/service_task.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // inject service task
    Get.lazyPut<ServiceTask>(() => ServiceTask());

    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<ServiceTask>()),
    );
  }
}
