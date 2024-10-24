import 'package:get/get.dart';
import 'package:pet_shop_manager/app/modules/home/controllers/home_controller.dart';
import 'package:pet_shop_manager/app/modules/mine_page/controllers/mine_page_controller.dart';
import 'package:pet_shop_manager/app/modules/record_page/controllers/record_page_controller.dart';
import 'package:pet_shop_manager/tools/pas_db.dart';

import '../controllers/tab_page_controller.dart';

class TabPageBinding extends Bindings {
  @override
  void dependencies() {
    PSDatabaseTool().init();
    Get.lazyPut<TabPageController>(
      () => TabPageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<RecordPageController>(
      () => RecordPageController(),
    );
    Get.lazyPut<MinePageController>(
      () => MinePageController(),
    );
  }
}
