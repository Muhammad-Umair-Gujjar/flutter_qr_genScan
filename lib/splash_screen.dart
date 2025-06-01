// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:qr_code_genscan/home_screen.dart';
//
// class splashScreen extends StatefulWidget {
//   const splashScreen({super.key});
//
//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }
//
// class _splashScreenState extends State<splashScreen> {
//   @override
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 4), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => homeScreen()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "QR GenScanner",
//               style: TextStyle(fontSize: 30,
//                   fontWeight: FontWeight.w700, color: Colors.black),
//             ),
//             Image(image: AssetImage('assets/image/logo_qr.png'),
//               width: screenWidth * 0.6,   // 50% of screen width
//               height: screenHeight * 0.4, // 30% of screen height
//               fit: BoxFit.contain,
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_code_genscan/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade-in animation setup
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();

    // Navigate after delay
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const   HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "QR GenScanner",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/image/logo_qr.png',
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:qr_code_genscan/home_screen.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Animation setup
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _fadeAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//
//     // Navigate after 4 seconds
//     Timer(const Duration(seconds: 8), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const homeScreen()),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.black, Colors.grey],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   width: screenWidth * 0.8,
//                   child: DefaultTextStyle(
//                     style: const TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     child: AnimatedTextKit(
//                       isRepeatingAnimation: false,
//                       animatedTexts: [
//                         TyperAnimatedText("QR GenScanner"),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Image.asset(
//                   'assets/image/logo_qr.png',
//                   width: screenWidth * 0.5,
//                   height: screenHeight * 0.3,
//                   fit: BoxFit.contain,
//                 ),
//                 const SizedBox(height: 30),
//                 const CircularProgressIndicator(
//                   color: Colors.white,
//                   strokeWidth: 3,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
