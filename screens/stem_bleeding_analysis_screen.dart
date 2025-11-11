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
          'Stem Bleeding – Detailed Analysis',
          style: TextStyle(
            color: Color(0xFF1F2D1F),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Leaf illustration (optional)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F8EB),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.eco,
                  size: 48,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 32),
              // Information card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(
                      label: 'Cause of Damage',
                      value: 'Fungal infection affecting trunk tissues',
                      icon: Icons.warning_amber,
                    ),
                    const Divider(height: 32),
                    _buildInfoRow(
                      label: '% of Damage',
                      value: '20%',
                      icon: Icons.trending_down,
                      valueColor: const Color(0xFFF5A524),
                    ),
                    const Divider(height: 32),
                    _buildInfoRow(
                      label: '% of Curability',
                      value: '75%',
                      icon: Icons.healing,
                      valueColor: const Color(0xFF2E7D32),
                    ),
                    const Divider(height: 32),
                    _buildInfoRow(
                      label: '% of Survivability',
                      value: '80%',
                      icon: Icons.check_circle,
                      valueColor: const Color(0xFF2E7D32),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // How to Cure button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to cure details
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'How to Cure',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
    required IconData icon,
    Color? valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: const Color(0xFF4F6A50),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4F6A50),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: valueColor ?? const Color(0xFF1F2D1F),
          ),
        ),
      ],
    );
  }
}
