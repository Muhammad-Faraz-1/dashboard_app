import 'package:flutter/material.dart';

class GlowingCircle extends StatefulWidget {
  final double size;
  final Color color;

  const GlowingCircle({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  _GlowingCircleState createState() => _GlowingCircleState();
}

class _GlowingCircleState extends State<GlowingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: 130,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)
          ),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return RadialGradient(
                center: Alignment.center,
                radius: 20, // Animating the radius
                colors: [
                  widget.color.withOpacity(1),
                  widget.color.withOpacity(0),
                ],
                stops: [0.0, 1.0],
              ).createShader(bounds);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: widget.color,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
