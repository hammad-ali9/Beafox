import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_screen.dart';
import 'enter_code_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
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
                const SizedBox(height: 38),
                _buildHeader(),
                const SizedBox(height: 36),
                _buildField(
                  label: 'Username',
                  controller: _usernameController,
                  hint: 'Your username',
                ),
                const SizedBox(height: 13),
                _buildField(
                  label: 'Email',
                  controller: _emailController,
                  hint: 'Example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 13),
                _buildPasswordField(
                  label: 'Create a password',
                  controller: _passwordController,
                  hint: 'Must be 8 characters',
                  obscure: _obscurePassword,
                  onToggle: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                const SizedBox(height: 13),
                _buildPasswordField(
                  label: 'Confirm password',
                  controller: _confirmController,
                  hint: 'Repeat password',
                  obscure: _obscureConfirm,
                  onToggle: () =>
                      setState(() => _obscureConfirm = !_obscureConfirm),
                ),
                const SizedBox(height: 22),
                _buildSignUpButton(),
                const SizedBox(height: 23),
                _buildDivider(),
                const SizedBox(height: 23),
                _buildSocialButtons(),
                const SizedBox(height: 30),
                _buildLoginLink(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).maybePop(),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Create a new account by filling these fields',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF272727),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF535353)),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: GoogleFonts.poppins(
                fontSize: 16, color: const Color(0xFFAFAFAF)),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 16, color: const Color(0xFFAFAFAF)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF272727),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF535353)),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            style: GoogleFonts.poppins(
                fontSize: 16, color: const Color(0xFFAFAFAF)),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 16, color: const Color(0xFFAFAFAF)),
              suffixIcon: GestureDetector(
                onTap: onToggle,
                child: Icon(
                  obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFFEB8A26),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          final email = _emailController.text.trim();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => EnterCodeScreen(
                email: email.isEmpty ? 'helloworld@gmail.com' : email,
              ),
            ),
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
          'Sign Up',
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

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
            child: Divider(
                color: Colors.white.withValues(alpha: 0.3), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or Continue with',
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
          ),
        ),
        Expanded(
            child: Divider(
                color: Colors.white.withValues(alpha: 0.3), thickness: 1)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        _SocialButton(
          icon: const FaIcon(FontAwesomeIcons.google,
              color: Color(0xFF4285F4), size: 20),
          label: 'Continue with Google',
        ),
        const SizedBox(height: 16),
        _SocialButton(
          icon: const FaIcon(FontAwesomeIcons.apple,
              color: Color(0xFFAFAFAF), size: 22),
          label: 'Continue with Apple',
        ),
      ],
    );
  }

  Widget _buildLoginLink() {
    return GestureDetector(
      onTap: _goToLogin,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
            TextSpan(
              text: 'Log In',
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
