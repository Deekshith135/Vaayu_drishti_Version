import 'package:flutter/material.dart';
import '../widgets/app_menu_bar.dart';

class CropSelectionScreen extends StatefulWidget {
  const CropSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CropSelectionScreen> createState() => _CropSelectionScreenState();
}

class _CropSelectionScreenState extends State<CropSelectionScreen> {
  String? _selectedCrop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E7D32),
      appBar: const AppMenuBar(title: 'Select Your Crop', currentRoute: '/crop-selection'),
      body: Padding(
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
                      isSelected: _selectedCrop == 'Coconut',
                      onTap: () {
                        setState(() {
                          _selectedCrop = 'Coconut';
                        });
                        Future.delayed(const Duration(milliseconds: 300), () {
                          Navigator.pushNamed(context, '/collecting-images');
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildCropCard(
                      emoji: '🌴',
                      cropName: 'Palm',
                      isSelected: _selectedCrop == 'Palm',
                      onTap: () {
                        setState(() {
                          _selectedCrop = 'Palm';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Palm crop coming soon!'),
                            backgroundColor: Color(0xFF2E7D32),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildCropCard(
                      emoji: '🍌',
                      cropName: 'Banana',
                      isSelected: _selectedCrop == 'Banana',
                      onTap: () {
                        setState(() {
                          _selectedCrop = 'Banana';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Banana crop coming soon!'),
                            backgroundColor: Color(0xFF2E7D32),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildCropCard({
    required String emoji,
    required String cropName,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Material(
        color: isSelected ? const Color(0xFFFFF8E1) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: isSelected ? 8 : 0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: isSelected ? 1.2 : 1.0),
                  duration: const Duration(milliseconds: 200),
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 36),
                      ),
                    );
                  },
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
      ),
    );
  }
}
