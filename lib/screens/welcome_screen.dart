import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const _orange = Color(0xFFEB8A26);
  static const _dark = Color(0xFF1B1B1B);

  void _goToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _orange,
        body: Stack(
          children: [
            // Decorative gradient ellipse behind the phone mockup
            Positioned(
              top: 91,
              left: 10,
              child: const SizedBox(
                width: 377,
                height: 323,
                child: CustomPaint(painter: _EllipsePainter()),
              ),
            ),
            // Phone mockup
            Positioned(
              top: 75,
              left: 47.5,
              child: Image.asset(
                'assets/images/welcome_mockup.png',
                width: 298,
                height: 610,
                fit: BoxFit.contain,
              ),
            ),
            // Bottom dark sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomSheet(context),
            ),
            // Floating notification card
            Positioned(
              top: 307,
              left: 25,
              right: 25,
              child: const _NotificationCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330,
      decoration: const BoxDecoration(
        color: _dark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 43, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More Knowledge More Money, More Freedom',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'BeAFox makes finance fun with interactive lessons, quizzes, and rewards.',
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: Colors.white.withValues(alpha: 0.4),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () => _goToLogin(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: _orange,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(73),
                ),
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: -0.315,
                ),
              ),
            ),
          ),
          const SizedBox(height: 21),
          Center(
            child: GestureDetector(
              onTap: () => _goToLogin(context),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 6.5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 38,
            height: 38,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFEB8A26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Welcome to BeAFox',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF222222),
                          letterSpacing: -0.26,
                        ),
                      ),
                    ),
                    Text(
                      'now',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: const Color(0xFF3F3F3F).withValues(alpha: 0.5),
                        letterSpacing: -0.22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Text(
                  'BeAFox makes finance fun with interactive lessons, quizzes, and reward',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xFF3F3F3F),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EllipsePainter extends CustomPainter {
  const _EllipsePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x00FFFFFF), Color(0x99FFFFFF)],
      ).createShader(rect);
    canvas.drawOval(rect.deflate(0.5), paint);
  }

  @override
  bool shouldRepaint(_EllipsePainter oldDelegate) => false;
}
