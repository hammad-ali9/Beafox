import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  static const _orange = Color(0xFFEB8A26);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1B1B),
        body: Center(
          child: Container(
            width: 335,
            constraints: const BoxConstraints(minHeight: 286),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
            decoration: BoxDecoration(
              color: const Color(0xFF272727),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF535353)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildBadge(),
                const SizedBox(height: 27),
                Text(
                  'Nice to Have You Here',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  "Let's get to know you better so we can tailor content just for you.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.7),
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 18),
                _buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x45FFFFFF), Color(0x00000000)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 38.16,
            height: 43.9,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 1.4),
          Text(
            'BeAFox',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 0.87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
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
    );
  }
}
