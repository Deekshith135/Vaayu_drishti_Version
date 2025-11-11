import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../widgets/app_menu_bar.dart';

class HealthSummaryScreen extends StatefulWidget {
  const HealthSummaryScreen({Key? key}) : super(key: key);

  @override
  State<HealthSummaryScreen> createState() => _HealthSummaryScreenState();
}

class _HealthSummaryScreenState extends State<HealthSummaryScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppMenuBar(title: 'Health Summary', currentRoute: '/health-summary'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Damage Probability & Crop Condition',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2D1F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Based on AI analysis, here\'s your crop health summary.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4F6A50),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            // Donut charts with animation
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Row(
                  children: [
                    Expanded(
                      child: _buildDonutChart(
                        title: 'Health',
                        percentage: (75 * _animation.value).toInt(),
                        color: const Color(0xFF2E7D32),
                        trackColor: const Color(0xFFE6F3E8),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildDonutChart(
                        title: 'Damage Probability',
                        percentage: (25 * _animation.value).toInt(),
                        color: const Color(0xFFF5A524),
                        trackColor: const Color(0xFFEFEFEF),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 40),
            // AI Suggestion card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFF5A524).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5A524),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lightbulb,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Re-spray pesticide after 5 days for best recovery.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1F2D1F),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Bottom buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, size: 20),
                    label: const Text('Back'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2E7D32),
                      side: const BorderSide(color: Color(0xFF2E7D32)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/disease-details');
                    },
                    label: const Text('View Details'),
                    icon: const Icon(Icons.analytics, size: 20),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonutChart({
    required String title,
    required int percentage,
    required Color color,
    required Color trackColor,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(140, 140),
                painter: DonutChartPainter(
                  percentage: percentage,
                  color: color,
                  trackColor: trackColor,
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2D1F),
          ),
          textAlign: TextAlign.center,
        ),
      ],
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
    final strokeWidth = 16.0;

    // Draw track
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - strokeWidth / 2, trackPaint);

    // Draw progress
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
