import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/features/splash/presentation/view/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppImages.logo),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {

        GoRouter.of(context).pushReplacement('/homeView');
        // Get.to(() => const HomeView(),
        //     transition: Transition.fade, duration: kTransitionDuration);
      },
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
