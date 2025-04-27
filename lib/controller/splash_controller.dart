import 'package:get/get.dart';
import 'package:sport_fm/services/local_storage.dart';
import 'package:sport_fm/views/screens/login/login_screen.dart';

import '../views/screens/bottom_nav_menu.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    LocalStorage box=LocalStorage();

   var isLogin=box.read('isLogin')??false;
   //print('ZZZZZ ${box.read('isLogin')}');
    if(isLogin){
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const BottomNavMenu());
      });
    }else{
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const LoginScreen());
      });
    }

    super.onInit();
  }
}
