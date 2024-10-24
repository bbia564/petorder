import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/app/modules/home/views/home_view.dart';
import 'package:pet_shop_manager/app/modules/mine_page/views/mine_page_view.dart';
import 'package:pet_shop_manager/app/modules/record_page/views/record_page_view.dart';

class TabPageController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  List<Widget> pageList = [
    const HomeView(),
    const RecordPageView(),
    const MinePageView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // PMDBTool().init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeCurrentPageIndex(int index) {
    currentIndex.value = index;
  }

  void showAddView() {
    Get.toNamed('/add-record-page',arguments: {});
  }
}

