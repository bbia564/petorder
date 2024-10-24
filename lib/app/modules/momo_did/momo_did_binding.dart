import 'package:get/get.dart';

import 'momo_did_logic.dart';

class MomoDidBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
