import 'package:get/get.dart';
import 'package:pet_shop_manager/app/assets/assets.dart';

class HomeController extends GetxController {
  final listModels = [
    {"title": "Pet Wash", "subTitle": "Dress up and love your pet", "img": Assets.wash},
    {"title": "Pet vaccine", "subTitle": "Prevent infectious diseases", "img": Assets.vaccine},
    {"title": "Pet food", "subTitle": "Store pet rations", "img": Assets.foods},
    {"title": "Pet medical", "subTitle": "Care for pet health", "img": Assets.medication}
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
