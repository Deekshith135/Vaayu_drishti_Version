import 'package:flutter/material.dart';

class DiseaseBreakdownScreen extends StatelessWidget {
  const DiseaseBreakdownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diseases = [
      {'name': 'Stem Bleeding', 'percentage': 20, 'color': const Color(0xFF2E7D32)},
      {'name': 'Grey Leaf Rot', 'percentage': 30, 'color': const Color(0xFFF5A524)},
      {'name': 'Leaf Spot', 'percentage': 40, 'color': const Color(0xFFFF9800)},
      {'name': 'Bud Rot', 'percentage': 10, 'color': const Color(0xFFFFB74D)},
    ];

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
          'Detected Diseases Breakdown',
          style: TextStyle(
            color: Color(0xFF1F2D1F),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Chart with bars
            Expanded(
              child: Column(
                children: [
                  // Y-axis labels
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Y-axis
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildAxisLabel('60%'),
                          const SizedBox(height: 60),
                          _buildAxisLabel('40%'),
                          const SizedBox(height: 60),
                          _buildAxisLabel('20%'),
                          const SizedBox(height: 60),
                          _buildAxisLabel('0%'),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Bars
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: diseases
                              .map((disease) => _buildDiseaseBar(
                                    name: disease['name'] as String,
                                    percentage: disease['percentage'] as int,
                                    color: disease['color'] as Color,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Helper text
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F8EB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.info_outline, color: Color(0xFF2E7D32), size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Tap on a disease to view cure details and pesticide suggestions.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF1F2D1F),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // View Details button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to details
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }

  Widget _buildAxisLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        color: Color(0xFF4F6A50),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildDiseaseBar({
    required String name,
    required int percentage,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1F2D1F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 13,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 16,
              backgroundColor: const Color(0xFFE9F8EB),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
