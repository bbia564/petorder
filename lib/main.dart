import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_shop_manager/tools/app_util.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/pas_nb.dart';

import 'app/modules/add_record_page/bindings/add_record_page_binding.dart';
import 'app/modules/add_record_page/views/add_record_page_view.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/mine_page/bindings/mine_page_binding.dart';
import 'app/modules/mine_page/views/mine_page_view.dart';
import 'app/modules/momo_did/momo_did_binding.dart';
import 'app/modules/momo_did/momo_did_view.dart';
import 'app/modules/record_page/bindings/record_page_binding.dart';
import 'app/modules/record_page/views/record_page_view.dart';
import 'app/modules/tab_page/bindings/tab_page_binding.dart';
import 'app/modules/tab_page/views/tab_page_view.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale("en", "US"),
    debugShowCheckedModeBanner: false,
    initialRoute: '/init',
    getPages: RNS,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
        scaffoldBackgroundColor: PMColorUitl.pmGetColor("#F2F2F2"),
        indicatorColor: Colors.grey,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.white.withOpacity(0),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: PMColorUitl.pmGetColor("#0F0F0F")),
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              statusBarColor: PMColorUitl.pmGetColor("#31BA6B")),
          backgroundColor: PMColorUitl.pmGetColor("#F5E7DE"),
          scrolledUnderElevation: 0.0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
    builder: builder,
    navigatorObservers: [BotToastNavigatorObserver()],
    supportedLocales: const [
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  _setBotToast();

  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final botToastBuilder = BotToastInit();

      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              PMAppUtil.keyboardDis(context);
            },
            child: child,
          );
          body = botToastBuilder(context, body);
          return body;
        },
      );
    },
  );
  return body;
}

void _setBotToast() {
  BotToast.defaultOption.notification.animationDuration =
      const Duration(seconds: 2);
}
List<GetPage<dynamic>> RNS = [
  GetPage(
    name: '/init',
    page: () => const MomoDidView(),
    binding: MomoDidBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/tab-page',
    page: () => const TabPageView(),
    binding: TabPageBinding(),
  ),
  GetPage(
    name: '/pas-nm',
    page: () => const PasNb(),
  ),
  GetPage(
    name: '/record-page',
    page: () => const RecordPageView(),
    binding: RecordPageBinding(),
  ),
  GetPage(
    name: '/mine-page',
    page: () => const MinePageView(),
    binding: MinePageBinding(),
  ),
  GetPage(
    name: '/add-record-page',
    page: () => const AddRecordPageView(),
    binding: AddRecordPageBinding(),
  ),
];