import 'package:get/get.dart';

class Dimensions {

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  //844/220 = 3.84
  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;
}
