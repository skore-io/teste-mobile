import 'package:get/get.dart';
import 'package:testemobile/app/pages/home/home_view.dart';
import 'app_routes.dart';
import 'pages/onboarding/onboarding_view.dart';
import 'pages/splash/splash_view.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      transition: Transition.native,
    ),
  ];
}
