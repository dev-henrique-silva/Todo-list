import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:todolist/utils/lottie_splash_screen_assets.dart';
import 'package:todolist/views/login/login_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.tomatoColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              LottieAnimationAssets.splashScreenAnimation,
              width: 240,
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
                Future.delayed(composition.duration).then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginView(),
                    ),
                  ),
                );
              },
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
