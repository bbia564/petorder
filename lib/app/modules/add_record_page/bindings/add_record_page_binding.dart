import 'package:get/get.dart';

import '../controllers/add_record_page_controller.dart';

class AddRecordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRecordPageController>(
      () => AddRecordPageController(),
    );
  }
}
