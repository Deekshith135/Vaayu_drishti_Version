import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String userName;
  
  const WelcomeScreen({Key? key, this.userName = 'John'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-bleed illustration background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF2E7D32).withOpacity(0.3),
                    const Color(0xFF4CAF50).withOpacity(0.2),
                  ],
                ),
              ),
              child: CustomPaint(
                painter: DroneHillsPainter(),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  // Welcome text
                  Column(
                    children: [
                      const Text(
                        'Welcome, Farmer!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2D1F),
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const Spacer(flex: 3),
                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to next screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Bottom navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2D1F)),
                        label: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1F2D1F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // Navigate to next
                        },
                        label: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1F2D1F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        icon: const Icon(Icons.arrow_forward, color: Color(0xFF1F2D1F)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DroneHillsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2E7D32).withOpacity(0.2)
      ..style = PaintingStyle.fill;

    // Draw hills
    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.4,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    // Draw drone
    final dronePaint = Paint()
      ..color = const Color(0xFF1F2D1F)
      ..style = PaintingStyle.fill;

    final droneX = size.width * 0.5;
    final droneY = size.height * 0.35;
    
    // Drone body (simplified)
    canvas.drawCircle(Offset(droneX, droneY), 20, dronePaint);
    canvas.drawCircle(Offset(droneX - 30, droneY - 10), 8, dronePaint);
    canvas.drawCircle(Offset(droneX + 30, droneY - 10), 8, dronePaint);
    canvas.drawCircle(Offset(droneX - 30, droneY + 10), 8, dronePaint);
    canvas.drawCircle(Offset(droneX + 30, droneY + 10), 8, dronePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
