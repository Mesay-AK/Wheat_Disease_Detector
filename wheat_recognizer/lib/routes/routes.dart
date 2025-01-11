import 'package:go_router/go_router.dart';
import 'package:wheat_recognizer/presentation/screens/aboutScreen.dart';
import 'package:wheat_recognizer/presentation/screens/homeScreen.dart';
import 'package:wheat_recognizer/presentation/screens/landingScreen.dart';
import 'package:camera/camera.dart';
import 'package:wheat_recognizer/presentation/screens/loadingScreen.dart';
import 'package:wheat_recognizer/presentation/screens/predictionScreen.dart';

GoRouter createRouter(CameraDescription camera) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LandingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => Home(), // Pass the camera here
      ),
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/prediction',
        builder: (context, state) => const PredictionScreen(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutScreen(),
      ),
    ],
  );
}