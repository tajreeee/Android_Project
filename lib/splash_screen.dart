
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// SplashScreen Widget
class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// SplashScreen State
class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  bool _hasNavigated = false;

  /// Navigates to the next page after delay
  void _goToNextPage() {
    if (!_hasNavigated) {
      _hasNavigated = true;
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 4),
            pageBuilder: (_, __, ___) => widget.child!,
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      });
    }
  }

  /// Main build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 117, 119),
      body: _buildPageView(),
    );
  }

  /// Refactored method: builds the PageView
  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (index) {
        if (index == 1) {
          _goToNextPage();
        }
      },
      children: const [
        LottieIntroPage(
          path: "assets/intro2.json",
          title: "Welcome to USA Study Guidance",
        ),
        LottieIntroPage(
          path: "assets/intro1.json",
          title: "Your Dream Journey Begins",
        ),
      ],
    );
  }
}

// LottieIntroPage (for better modularity)

class LottieIntroPage extends StatelessWidget {
  final String path;
  final String title;

  const LottieIntroPage({super.key, required this.path, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          path,
          height: 300,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
