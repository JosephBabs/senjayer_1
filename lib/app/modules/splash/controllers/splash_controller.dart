import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // _checkUserLoginStatus();
    _checkFirstTimeUser();
  }

  void _checkFirstTimeUser() async {
    await Future.delayed(Duration(seconds: 4)); // Simulate loading

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;

    if (isFirstTime) {
      Get.offAllNamed(AppRoutes.ONBOARDING);
    } else {
      // Get.offAllNamed(AppRoutes.ONBOARDING);

      // _checkUserLoginStatus();
      _checkUserLoginStatus();
      // Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  void _checkUserLoginStatus() async {
    await Future.delayed(Duration(seconds: 3)); // Simulated splash delay

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Check if user token exists
    print('Ehh');
    if (token != null) {
      // User is logged in, go to dashboard
      Get.offAllNamed(AppRoutes.DASHBOARD);
    } else {
      // User is not logged in, go to login page
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }
}
