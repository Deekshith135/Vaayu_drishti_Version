import 'package:flutter/material.dart';

class DiseaseBreakdownScreen extends StatelessWidget {
  const DiseaseBreakdownScreen({Key? key}) : super(key: key);

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
          'Disease Breakdown',
          style: TextStyle(color: Color(0xFF1F2D1F)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _BreakdownRow(label: 'Stem Bleeding', percent: 40, color: Color(0xFFD32F2F)),
            const SizedBox(height: 16),
            const _BreakdownRow(label: 'Bud Rot', percent: 30, color: Color(0xFFF57C00)),
            const SizedBox(height: 16),
            const _BreakdownRow(label: 'Leaf Spot', percent: 20, color: Color(0xFF388E3C)),
            const SizedBox(height: 16),
            const _BreakdownRow(label: 'Other', percent: 10, color: Color(0xFF1976D2)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/stem-analysis');
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('View Detailed Analysis'),
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

class _BreakdownRow extends StatelessWidget {
  final String label;
  final int percent;
  final Color color;

  const _BreakdownRow({
    Key? key,
    required this.label,
    required this.percent,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2D1F),
              ),
            ),
            Text(
              '$percent%',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4F6A50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            minHeight: 12,
            value: percent / 100,
            backgroundColor: const Color(0xFFE6E6E6),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
