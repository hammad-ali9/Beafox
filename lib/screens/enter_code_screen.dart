import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class EnterCodeScreen extends StatefulWidget {
  final String email;

  /// Screen to navigate to after a successful verification.
  /// Defaults to [HomeScreen] (registration flow). The forgot-password flow
  /// passes the reset-password screen here.
  final Widget? nextScreen;

  const EnterCodeScreen({
    super.key,
    this.email = 'helloworld@gmail.com',
    this.nextScreen,
  });

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  static const _orange = Color(0xFFEB8A26);
  static const int _length = 6;

  final List<TextEditingController> _controllers =
      List.generate(_length, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(_length, (_) => FocusNode());

  Timer? _timer;
  int _secondsLeft = 20;

  @override
  void initState() {
    super.initState();
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = 20);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 0) {
        t.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < _length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {});
  }

  void _verify() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => widget.nextScreen ?? const HomeScreen(),
      ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                _buildHeader(),
                const SizedBox(height: 36),
                Text(
                  'Enter 6 Digit Code',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 8),
                _buildOtpRow(),
                const SizedBox(height: 10),
                _buildResendRow(),
                const SizedBox(height: 15),
                _buildVerifyButton(),
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
        const SizedBox(width: 21),
        Expanded(
          child: Column(
            children: [
              Text(
                'Enter code',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.16,
                ),
              ),
              const SizedBox(height: 9),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "We've sent a code to ",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    TextSpan(
                      text: widget.email,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _orange,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _buildOtpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_length, (i) => _buildOtpBox(i)),
    );
  }

  Widget _buildOtpBox(int index) {
    final filled = _controllers[index].text.isNotEmpty;
    final focused = _focusNodes[index].hasFocus;
    final active = filled || focused;
    return SizedBox(
      width: 54,
      height: 56,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: _orange,
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: filled ? const Color(0xFF232323) : Colors.transparent,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: active ? _orange : const Color(0xFF535353),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: _orange),
          ),
        ),
        onChanged: (v) => _onChanged(index, v),
      ),
    );
  }

  Widget _buildResendRow() {
    final canResend = _secondsLeft == 0;
    return Row(
      children: [
        GestureDetector(
          onTap: canResend ? _startTimer : null,
          child: Text(
            'Send code again',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.7),
              decoration: TextDecoration.underline,
              decorationColor: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '00:${_secondsLeft.toString().padLeft(2, '0')}',
          style: GoogleFonts.poppins(fontSize: 16, color: _orange),
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: _verify,
        style: ElevatedButton.styleFrom(
          backgroundColor: _orange,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(73),
          ),
        ),
        child: Text(
          'Verify Code',
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
