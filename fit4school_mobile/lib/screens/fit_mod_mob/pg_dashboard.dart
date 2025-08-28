//IMPORTS
import 'package:flutter/material.dart';


//STATEFUL WIDGET
class PgDashboard extends StatefulWidget {
  const PgDashboard({super.key});

  @override
  State<PgDashboard> createState() => _PgDashboardState();
}

//INDEX FOR BOTTOM NAVIGATION BAR
class _PgDashboardState extends State<PgDashboard> {
  int _index = 0;

  final List<Widget> _pages = <Widget>[
    const _DemoPage('Home Page'),
    const _DemoPage('Inbox Page'),
    const _DemoPage('AR Fitting Page'),
    const _DemoPage('Transaction Page'),
    const _DemoPage('Account Page'),
  ];

  void _go(int i) => setState(() => _index = i);


//MAIN SCREEN DESIGN
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_index],

      bottomNavigationBar: SizedBox(
        height: 125,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _ConvexNavPainter(color: const Color(0xFF0FAFFF)),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNavItem(Icons.home_outlined, 'Home', 0),
                    _buildNavItem(Icons.mail_outline_rounded, 'Inbox', 1),
                    const SizedBox(width: 100), // gap for AR button
                    _buildNavItem(Icons.receipt_outlined, 'Transaction', 3),
                    _buildNavItem(Icons.account_circle, 'Account', 4),
                  ],
                ),
              ),
            ),


            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => _go(2),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6BD368),
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.view_in_ar,
                          size: 38,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'AR Fitting',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//NAVIGATION BAR ACTIONS
  Widget _buildNavItem(IconData icon, String label, int index) {
    bool selected = _index == index;
    return InkWell(
      onTap: () => _go(index),
      child: Container(
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withOpacity(0.2)
              : Colors.transparent, 
          borderRadius: BorderRadius.circular(20), 
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 6,
        ), 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 45, color: Colors.black),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 11.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//FOR NAVIGATION BAR CONVEX ARC DESIGN
class _ConvexNavPainter extends CustomPainter {
  final Color color;
  _ConvexNavPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double top = 10;
    final double arcWidth = 120;
    final double arcHeight = 68;
    final double cx = size.width / 2;
    final double leftArcX = cx - arcWidth / 2;
    final double rightArcX = cx + arcWidth / 2;

    final path = Path()
      ..moveTo(0, top)
      ..lineTo(leftArcX, top)
      ..quadraticBezierTo(cx, top - arcHeight, rightArcX, top)
      ..lineTo(size.width, top)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.7), 8, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DemoPage extends StatelessWidget {
  final String text;
  const _DemoPage(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontSize: 20)),
    );
  }
}
