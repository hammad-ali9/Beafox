import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1B1B),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100.35,
                      height: 115.42,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 3.72),
                    Text(
                      'BeAFox',
                      style: GoogleFonts.poppins(
                        fontSize: 36.87,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment(0, 0.78),
                child: _SplashSpinner(size: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashSpinner extends StatefulWidget {
  final double size;
  const _SplashSpinner({required this.size});

  @override
  State<_SplashSpinner> createState() => _SplashSpinnerState();
}

class _SplashSpinnerState extends State<_SplashSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _SpinnerPainter(_controller.value),
          );
        },
      ),
    );
  }
}

class _SpinnerPainter extends CustomPainter {
  final double progress;
  static const int dotCount = 8;
  static const Color color = Color(0xFFEB8A26);

  _SpinnerPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    final rotation = progress * 2 * math.pi;
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < dotCount; i++) {
      final angle = rotation + (i / dotCount) * 2 * math.pi;
      final t = i / dotCount;
      final dotCenter = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      paint.color = color.withValues(alpha: 0.25 + 0.75 * t);
      canvas.drawCircle(dotCenter, 2.5 + 2.5 * t, paint);
    }
  }

  @override
  bool shouldRepaint(_SpinnerPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
