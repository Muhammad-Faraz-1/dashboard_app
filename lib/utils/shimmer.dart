import 'package:flutter/material.dart';
// import 'dart:async';

class CustomShimmer extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const CustomShimmer({
    Key? key,
    this.width = 320.0,
    this.height = 80.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  _CustomShimmerState createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Controls shimmer speed
      lowerBound: -1.0,
      upperBound: 2.0,
    )..repeat(
        period: Duration(milliseconds: 800)); // Continuous loop with delay
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Stack(
            children: [
              Container(
                width: widget.width,
                // height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                color:
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                ),
              ),
              Positioned(
                top: -20,
                left: _controller.value * widget.width, // Moves shimmer box
                child: Transform.rotate(
                  angle: 60,
                  child: Container(
                    width: widget.width * 0.3, // Define shimmer width
                    height: widget.height + 30,
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.white.withOpacity(0.5),
                      //     spreadRadius: 2,
                      //     blurRadius: 40
                      //   )
                      // ],
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white.withOpacity(0.01),
                          const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3),
                          Colors.white.withOpacity(0.01),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
