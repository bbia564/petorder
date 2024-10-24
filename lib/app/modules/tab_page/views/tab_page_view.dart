import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_shop_manager/app/assets/assets.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';

import '../controllers/tab_page_controller.dart';

class TabPageView extends GetView<TabPageController> {
  const TabPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            children: controller.pageList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            fixedColor: PMColorUitl.pmGetColor("#FF7D27"),
            unselectedLabelStyle: TextStyle(
                color: PMColorUitl.pmGetColor("#292929"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(
                color: PMColorUitl.pmGetColor("#FF7D27"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
            onTap: (value) {
              controller.currentIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.mainNor),
                  activeIcon: _tbTbarItem(Assets.mainSel),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.recordNor),
                  activeIcon: _tbTbarItem(Assets.recordSel),
                  label: "Record"),
              BottomNavigationBarItem(
                label: "Settings",
                icon: _tbTbarItem(Assets.settingsNor),
                activeIcon: _tbTbarItem(Assets.settingsSel),
              )
            ],
          ),
        ));
  }

  Widget _tbTbarItem(String name) {
    return Image.asset(
      name,
      height: 22.h,
      width: 22.h,
      fit: BoxFit.cover,
    );
  }
}
