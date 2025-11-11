import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE9F8EB), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Spacer(),
                // Confetti decoration
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildConfetti(Colors.yellow, -20, -10),
                    _buildConfetti(Colors.green, -10, -20),
                    const SizedBox(width: 40),
                    _buildConfetti(Colors.orange, 10, -20),
                    _buildConfetti(Colors.blue, 20, -10),
                  ],
                ),
                const SizedBox(height: 40),
                // Illustration
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF2E7D32).withOpacity(0.2),
                        const Color(0xFF4CAF50).withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(double.infinity, 200),
                        painter: FieldPainter(),
                      ),
                      const Positioned(
                        top: 40,
                        child: Icon(
                          Icons.flight,
                          size: 60,
                          color: Color(0xFF1F2D1F),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                // Thank You title
                const Text(
                  'Thank You!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 20),
                // Body text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Your Basic Plan process is complete. Continue exploring Farm Drone for more features.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4F6A50),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                // Back to Home button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to home
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Back chevron
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF2E7D32)),
                  label: const Text(
                    'Previous Step',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Footer
                const Text(
                  'Powered by Farm Care',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFAAB8AD),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfetti(Color color, double dx, double dy) {
    return Transform.translate(
      offset: Offset(dx, dy),
      child: Transform.rotate(
        angle: 0.3,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}

class FieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2E7D32).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    // Draw rolling hills representing fields
    final path = Path();
    path.moveTo(0, size.height * 0.6);
    
    // First hill
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.4,
      size.width * 0.5,
      size.height * 0.55,
    );
    
    // Second hill
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.6,
    );
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    canvas.drawPath(path, paint);
    
    // Draw field lines
    final linePaint = Paint()
      ..color = const Color(0xFF2E7D32).withOpacity(0.2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    for (int i = 1; i < 4; i++) {
      final y = size.height * 0.6 + (i * 20);
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
