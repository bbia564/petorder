import 'package:get/get.dart';

import '../controllers/record_page_controller.dart';

class RecordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordPageController>(
      () => RecordPageController(),
    );
  }
}
