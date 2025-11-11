import 'package:flutter/material.dart';

class StemBleedingAnalysisScreen extends StatelessWidget {
  const StemBleedingAnalysisScreen({Key? key}) : super(key: key);

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
          'Stem Bleeding Analysis',
          style: TextStyle(color: Color(0xFF1F2D1F)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF8BBD0)),
              ),
              child: Row(
                children: const [
                  Icon(Icons.warning_amber_rounded, color: Color(0xFFD32F2F)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'High probability of stem bleeding detected. Immediate action is recommended.',
                      style: TextStyle(
                        color: Color(0xFF1F2D1F),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Recommended Treatment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2D1F),
              ),
            ),
            const SizedBox(height: 12),
            const _Bullet(text: 'Apply Bordeaux paste around the affected area.'),
            const _Bullet(text: 'Ensure proper drainage to avoid water stagnation.'),
            const _Bullet(text: 'Remove heavily infected tissues carefully.'),
            const SizedBox(height: 24),
            const Text(
              'Next Steps',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2D1F),
              ),
            ),
            const SizedBox(height: 12),
            const _Bullet(text: 'Monitor for new lesions and oozing.'),
            const _Bullet(text: 'Schedule a follow-up scan in 7 days.'),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/expert-connect');
              },
              icon: const Icon(Icons.phone),
              label: const Text('Connect with Expert'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  ', style: TextStyle(fontSize: 18, color: Color(0xFF4F6A50))),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF4F6A50),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
