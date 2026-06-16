import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1B1B),
        body: Column(
          children: [
            _buildTopCard(),
            Expanded(child: _buildJourneyMap()),
          ],
        ),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  Widget _buildTopCard() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF272727),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
        border: Border(
          bottom: BorderSide(color: Color(0xFF535353)),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _buildGreetingRow(),
            const SizedBox(height: 20),
            _buildStatsRow(),
            const SizedBox(height: 16),
            Container(height: 1, color: const Color(0xFF535353)),
            const SizedBox(height: 16),
            _buildMotivationalRow(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: -0.315,
                ),
              ),
              Text(
                'Raja Saif!',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: -0.315,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF28B21),
              borderRadius: BorderRadius.circular(29),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 16),
                const SizedBox(width: 6),
                Text(
                  'Level 1: Your Future',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    letterSpacing: -0.315,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatItem(
            icon: const FaIcon(FontAwesomeIcons.bookOpen, color: Colors.white, size: 20),
            label: '1/02',
            isActive: true,
          ),
          _StatItem(
            icon: const FaIcon(FontAwesomeIcons.fire, color: Color(0xFFEB8A26), size: 20),
            label: '20%',
          ),
          _StatItem(
            icon: const FaIcon(FontAwesomeIcons.coins, color: Color(0xFFF1BB08), size: 20),
            label: '250',
          ),
          _StatItem(
            icon: const FaIcon(FontAwesomeIcons.solidHeart, color: Color(0xFFE04B4B), size: 20),
            label: '23',
          ),
        ],
      ),
    );
  }

  Widget _buildMotivationalRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Financial education is important!',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.315,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Those who understand their finances have more control over their lives',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.7),
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF535353), width: 0.789),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.menu, color: Colors.white, size: 19),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyMap() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return Stack(
          children: [
            CustomPaint(
              size: Size(w, h),
              painter: _JourneyPathPainter(width: w, height: h),
            ),
            // Active node: dollar (right, near top)
            Positioned(
              right: w * 0.18,
              top: h * 0.05,
              child: _JourneyNode(
                icon: const FaIcon(FontAwesomeIcons.moneyBill1, color: Colors.white, size: 28),
                isActive: true,
              ),
            ),
            // Gift node: left, middle-upper
            Positioned(
              left: w * 0.04,
              top: h * 0.24,
              child: const _JourneyNode(
                icon: Icon(Icons.card_giftcard, color: Colors.white, size: 28),
                isActive: false,
              ),
            ),
            // Dollar node: right, middle
            Positioned(
              right: w * 0.1,
              top: h * 0.44,
              child: const _JourneyNode(
                icon: FaIcon(FontAwesomeIcons.moneyBill1, color: Colors.white, size: 28),
                isActive: false,
              ),
            ),
            // Gift node: left, lower
            Positioned(
              left: w * 0.12,
              top: h * 0.65,
              child: const _JourneyNode(
                icon: Icon(Icons.card_giftcard, color: Colors.white, size: 28),
                isActive: false,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF272727)),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'Home',
                isActive: _currentNavIndex == 0,
                onTap: () => setState(() => _currentNavIndex = 0),
              ),
              _NavItem(
                icon: Icons.fitness_center,
                label: 'Training',
                isActive: _currentNavIndex == 1,
                onTap: () => setState(() => _currentNavIndex = 1),
              ),
              _NavItem(
                icon: Icons.shield_outlined,
                label: 'Rangliste',
                isActive: _currentNavIndex == 2,
                onTap: () => setState(() => _currentNavIndex = 2),
              ),
              _NavItem(
                icon: Icons.rocket_launch_outlined,
                label: 'Missionen',
                isActive: _currentNavIndex == 3,
                onTap: () => setState(() => _currentNavIndex = 3),
              ),
              _NavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                isActive: _currentNavIndex == 4,
                onTap: () => setState(() => _currentNavIndex = 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isActive;

  const _StatItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      height: 77,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFEB8A26) : Colors.white,
        shape: BoxShape.circle,
        border: isActive ? null : Border.all(color: const Color(0xFF535353)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 9.7,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : const Color(0xFF403C3C),
            ),
          ),
        ],
      ),
    );
  }
}

class _JourneyNode extends StatelessWidget {
  final Widget icon;
  final bool isActive;

  const _JourneyNode({required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 89,
      height: 89,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFEB8A26) : const Color(0xFF3A3A3A),
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: const Color(0xFFEB8A26).withValues(alpha: 0.45),
                  blurRadius: 24,
                  spreadRadius: 4,
                ),
              ]
            : null,
      ),
      child: Center(child: icon),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFFEB8A26) : const Color(0xFF767676);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: color,
                letterSpacing: -0.048,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JourneyPathPainter extends CustomPainter {
  final double width;
  final double height;

  const _JourneyPathPainter({required this.width, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final activePaint = Paint()
      ..color = const Color(0xFFEB8A26)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final inactivePaint = Paint()
      ..color = const Color(0xFF535353)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Node centers (proportional to width/height)
    final node1 = Offset(width - width * 0.18 - 44.5, height * 0.05 + 44.5); // active (right)
    final node2 = Offset(width * 0.04 + 44.5, height * 0.24 + 44.5);         // gift (left)
    final node3 = Offset(width - width * 0.1 - 44.5, height * 0.44 + 44.5); // dollar (right)
    final node4 = Offset(width * 0.12 + 44.5, height * 0.65 + 44.5);        // gift (left)

    // Path: node1 -> node2 (active/orange)
    final p1 = Path()
      ..moveTo(node1.dx, node1.dy + 44.5)
      ..cubicTo(
        node1.dx - 40, node1.dy + 80,
        node2.dx + 60, node2.dy - 60,
        node2.dx, node2.dy - 44.5,
      );
    _drawDashed(canvas, p1, activePaint);

    // Path: node2 -> node3 (inactive/gray)
    final p2 = Path()
      ..moveTo(node2.dx, node2.dy + 44.5)
      ..cubicTo(
        node2.dx + 40, node2.dy + 80,
        node3.dx - 80, node3.dy - 60,
        node3.dx, node3.dy - 44.5,
      );
    _drawDashed(canvas, p2, inactivePaint);

    // Path: node3 -> node4 (inactive/gray)
    final p3 = Path()
      ..moveTo(node3.dx, node3.dy + 44.5)
      ..cubicTo(
        node3.dx - 40, node3.dy + 80,
        node4.dx + 80, node4.dy - 60,
        node4.dx, node4.dy - 44.5,
      );
    _drawDashed(canvas, p3, inactivePaint);
  }

  void _drawDashed(Canvas canvas, Path path, Paint paint) {
    const dashLen = 10.0;
    const gapLen = 7.0;
    for (final metric in path.computeMetrics()) {
      double d = 0;
      while (d < metric.length) {
        final end = (d + dashLen).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(d, end), paint);
        d += dashLen + gapLen;
      }
    }
  }

  @override
  bool shouldRepaint(_JourneyPathPainter old) =>
      old.width != width || old.height != height;
}
