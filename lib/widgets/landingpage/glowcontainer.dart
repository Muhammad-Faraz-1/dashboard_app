import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlowingImage extends StatefulWidget {
  @override
  _GlowingImageState createState() => _GlowingImageState();
}

class _GlowingImageState extends State<GlowingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Control speed of glow
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.0, end: 50.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return GlowContainer(
                // height: 100,
                // width: 50,
                glowColor: Color(0xff43CC5C),
                blurRadius: 20, // Animated glow effect
                spreadRadius: 5,
                shape: BoxShape.circle,
                child: SizedBox(
                  height: 130.h,
                  width: 120.w,
                ),
              );
            },
          ),
          // SizedBox(
          //   height: 130.h,
          //   width: 120.w,
          //   child: Image.asset(
          //     'assets/sheild.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//////////////////////////////////


class GlowEffectScreen extends StatefulWidget {
  @override
  _GlowEffectScreenState createState() => _GlowEffectScreenState();
}

class _GlowEffectScreenState extends State<GlowEffectScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Time to glow and dim
    )..repeat(reverse: true); // Repeats the glow animation back and forth

    _glowAnimation = Tween<double>(begin: 5.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Glowing Effect (Placed behind other widgets)
            AnimatedBuilder(
              animation: _glowAnimation,
              builder: (context, child) {
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(0.2), // Subtle light source
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.8),
                        // blurRadius: _glowAnimation.value,
                        blurRadius: 50.w,
                        spreadRadius: 5.w
                        // spreadRadius: _glowAnimation.value / 2, // Spread effect
                      ),
                    ],
                  ),
                );
              },
            ),

            // Widget placed in front of the glow
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow, // Solid object blocking the light
              ),
            ),
          ],
        ),
      );
  }
}