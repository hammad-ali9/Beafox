import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'registration_screen.dart';
import 'welcome_back_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'rajasaifali125@gmail.com');
  final _passwordController = TextEditingController(text: 'dafasjif398y4456');
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1B1B),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 45),
                _buildHeader(),
                const SizedBox(height: 40),
                _buildEmailField(),
                const SizedBox(height: 22),
                _buildPasswordField(),
                const SizedBox(height: 6),
                _buildForgotPassword(),
                const SizedBox(height: 22),
                _buildLoginButton(),
                const SizedBox(height: 23),
                _buildDivider(),
                const SizedBox(height: 16),
                _buildSocialButtons(),
                const SizedBox(height: 40),
                _buildSignUpLink(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Welcome Back! 👋',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Please enter your login details.',
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF272727),
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: const Color(0xFF535353)),
          ),
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.poppins(fontSize: 16, color: const Color(0xFFAFAFAF)),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(fontSize: 16, color: const Color(0xFFAFAFAF)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Password',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF272727),
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: const Color(0xFF535353)),
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            style: GoogleFonts.poppins(fontSize: 16, color: const Color(0xFFAFAFAF)),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () => setState(() => _obscurePassword = !_obscurePassword),
                child: Icon(
                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: const Color(0xFFAFAFAF),
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'Forgot password?',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const WelcomeBackScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEB8A26),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(73),
          ),
        ),
        child: Text(
          'Log In',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: -0.315,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or Continue with',
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
          ),
        ),
        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3), thickness: 1)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        _SocialButton(
          icon: const FaIcon(FontAwesomeIcons.google, color: Color(0xFF4285F4), size: 20),
          label: 'Continue with Google',
        ),
        const SizedBox(height: 16),
        _SocialButton(
          icon: const FaIcon(FontAwesomeIcons.apple, color: Color(0xFFAFAFAF), size: 22),
          label: 'Continue with Apple',
        ),
      ],
    );
  }

  Widget _buildSignUpLink() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const RegistrationScreen()),
      ),
      child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFFCFCFCF).withValues(alpha: 0.7),
            ),
          ),
          TextSpan(
            text: 'Sign up',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFEB8A26),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Widget icon;
  final String label;

  const _SocialButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFDCDEE0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(73),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFAFAFAF),
                letterSpacing: 0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
