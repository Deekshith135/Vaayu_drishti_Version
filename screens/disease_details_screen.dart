import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiseaseDetailsScreen extends StatelessWidget {
  const DiseaseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2D1F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detected Disease Details',
          style: TextStyle(
            color: Color(0xFF1F2D1F),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Large photo at top
            Container(
              margin: const EdgeInsets.all(24),
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFE9F8EB),
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/400x200'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Disease name
                  const Text(
                    'Leaf Spot',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2D1F),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Symptoms
                  const Text(
                    'Symptoms detected: brown patches and yellowing of leaves.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF4F6A50),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Severity donut chart
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomPaint(
                                size: const Size(180, 180),
                                painter: DonutChartPainter(
                                  percentage: 60,
                                  color: const Color(0xFFF5A524),
                                  trackColor: const Color(0xFFE6F3E8),
                                ),
                              ),
                              const Text(
                                '60%',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F2D1F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildLegendItem('Infected', 60, const Color(0xFFF5A524)),
                            const SizedBox(width: 32),
                            _buildLegendItem('Healthy', 40, const Color(0xFF2E7D32)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Action buttons
                  _buildActionButton(
                    label: 'Pesticide Suggestion',
                    icon: Icons.science,
                    onPressed: () {
                      // Navigate to pesticide suggestions
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildActionButton(
                    label: 'View Severity Graph',
                    icon: Icons.bar_chart,
                    onPressed: () {
                      // Navigate to severity graph
                    },
                  ),
                  const SizedBox(height: 40),
                  // Bottom navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Color(0xFF2E7D32)),
                        label: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2E7D32),
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
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        icon: const Icon(Icons.arrow_forward, color: Color(0xFF2E7D32)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      'Powered by Farm Care',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFAAB8AD),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, int percentage, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$label $percentage%',
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF4F6A50),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE9F8EB),
          foregroundColor: const Color(0xFF1F2D1F),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final int percentage;
  final Color color;
  final Color trackColor;

  DonutChartPainter({
    required this.percentage,
    required this.color,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 20.0;

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - strokeWidth / 2, trackPaint);

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
