import 'package:flutter/material.dart';
import '../widgets/app_menu_bar.dart';

class ExpertConnectScreen extends StatelessWidget {
  const ExpertConnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppMenuBar(title: 'Expert Connect', currentRoute: '/expert-connect'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Talk to an Agronomist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2D1F),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Get personalized advice based on your crop health report.',
              style: TextStyle(color: Color(0xFF4F6A50), height: 1.5),
            ),
            const SizedBox(height: 24),
            _expertCard(
              name: 'Dr. Meera Nair',
              specialty: 'Plant Pathologist',
              rating: 4.9,
              languages: 'English, Malayalam, Hindi',
            ),
            const SizedBox(height: 16),
            _expertCard(
              name: 'Arun Kumar',
              specialty: 'Crop Scientist',
              rating: 4.7,
              languages: 'English, Tamil',
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Call request sent! An expert will contact you soon.'),
                    backgroundColor: Color(0xFF2E7D32),
                    duration: Duration(seconds: 3),
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushNamed(context, '/thank-you');
                });
              },
              icon: const Icon(Icons.call),
              label: const Text('Request a Call'),
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

  Widget _expertCard({
    required String name,
    required String specialty,
    required double rating,
    required String languages,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x0F000000), blurRadius: 12, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFFE6F3E8),
            child: Icon(Icons.person, color: Color(0xFF2E7D32)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2D1F),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: const TextStyle(color: Color(0xFF4F6A50)),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
                    const SizedBox(width: 4),
                    Text('$rating', style: const TextStyle(color: Color(0xFF1F2D1F))),
                    const SizedBox(width: 12),
                    const Icon(Icons.language, size: 18, color: Color(0xFF4F6A50)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        languages,
                        style: const TextStyle(color: Color(0xFF4F6A50)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
