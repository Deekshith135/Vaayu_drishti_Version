import 'package:flutter/material.dart';

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
          'Disease Details',
          style: TextStyle(color: Color(0xFF1F2D1F)),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _diseaseCard(
            title: 'Stem Bleeding',
            severity: 'High',
            description:
                'Caused by fungal infection resulting in brown to black lesions with oozing fluid. Immediate treatment recommended.',
            color: const Color(0xFFD32F2F),
          ),
          const SizedBox(height: 16),
          _diseaseCard(
            title: 'Bud Rot',
            severity: 'Medium',
            description:
                'Rotting and browning of the central spindle leaves. Requires fungicide spray and sanitation.',
            color: const Color(0xFFF57C00),
          ),
          const SizedBox(height: 16),
          _diseaseCard(
            title: 'Leaf Spot',
            severity: 'Low',
            description:
                'Small circular spots on leaves, often self-limiting but monitor regularly.',
            color: const Color(0xFF388E3C),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/disease-breakdown');
            },
            icon: const Icon(Icons.pie_chart),
            label: const Text('See Breakdown'),
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
    );
  }

  Widget _diseaseCard({
    required String title,
    required String severity,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2D1F),
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  severity,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF4F6A50),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
