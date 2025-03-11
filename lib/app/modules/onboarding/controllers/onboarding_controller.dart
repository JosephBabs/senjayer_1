import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    checkIfFirstTimeUser();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
    // Get.offAllNamed(AppRoutes.ONBOARDING);

    Get.offAllNamed(AppRoutes.LOGIN); // Navigate to home after onboarding
  }

  Future<void> checkIfFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;

    if (!isFirstTime) {
      // Get.offAllNamed(AppRoutes.ONBOARDING);
      // Get.offAllNamed(AppRoutes.LOGIN);
      _checkUserLoginStatus();
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
