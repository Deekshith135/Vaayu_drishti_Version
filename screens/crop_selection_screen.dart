import 'package:flutter/material.dart';

class CropSelectionScreen extends StatelessWidget {
  const CropSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E7D32),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Drone icon
              const Icon(
                Icons.flight,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 40),
              const Text(
                'Select Your Crop',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              // Crop selection cards
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCropCard(
                      emoji: '🥥',
                      cropName: 'Coconut',
                      onTap: () {
                        // Navigate to coconut details
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildCropCard(
                      emoji: '🌴',
                      cropName: 'Palm',
                      onTap: () {
                        // Navigate to palm details
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildCropCard(
                      emoji: '🍌',
                      cropName: 'Banana',
                      onTap: () {
                        // Navigate to banana details
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCropCard({
    required String emoji,
    required String cropName,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 36),
              ),
              const SizedBox(width: 20),
              Text(
                cropName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2D1F),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF4F6A50),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
