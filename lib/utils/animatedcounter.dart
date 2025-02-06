import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceleratingCounter extends StatefulWidget {
  final int targetNumber;
  final Color color;

  const AcceleratingCounter({super.key, required this.targetNumber, required this.color});

  @override
  _AcceleratingCounterState createState() => _AcceleratingCounterState();
}

class _AcceleratingCounterState extends State<AcceleratingCounter> {
  bool _isVisible = false;
  int _counter = 0;
  late Timer _timer;

  void _startCounter() {
    if (_isVisible && _counter == 0) {
      _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
        setState(() {
          if (_counter < widget.targetNumber) {
            _counter += (widget.targetNumber / 30).ceil(); // Adjusting speed
            if (_counter > widget.targetNumber) {
              _counter = widget.targetNumber;
              _timer.cancel();
            }
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            if (!_isVisible) {
              final RenderObject? renderObject = context.findRenderObject();
              if (renderObject != null && renderObject is RenderBox) {
                final position = renderObject.localToGlobal(Offset.zero);
                final screenHeight = MediaQuery.of(context).size.height;

                if (position.dy < screenHeight && position.dy + constraints.maxHeight > 0) {
                  setState(() {
                    _isVisible = true;
                    _startCounter();
                  });
                }
              }
            }
            return false;
          },
          child: Text(
            '$_counter%', // Adding % sign
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: widget.color,
                fontSize: 22.sp,
                height: 1.13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
