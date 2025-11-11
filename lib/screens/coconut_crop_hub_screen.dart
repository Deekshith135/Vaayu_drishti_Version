import 'package:flutter/material.dart';

class CoconutCropHubScreen extends StatelessWidget {
  const CoconutCropHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2D1F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'COCONUT CROP',
          style: TextStyle(
            color: Color(0xFF1F2D1F),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Large top tile - Monitor Crop Health
            Expanded(
              flex: 2,
              child: _buildFeatureTile(
                title: 'Monitor Crop Health',
                icon: Icons.park,
                isLarge: true,
                color: const Color(0xFF2E7D32),
                onTap: () {
                  // Navigate to crop health monitoring
                },
              ),
            ),
            const SizedBox(height: 16),
            // Two small tiles side by side
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildFeatureTile(
                      title: 'Detect Diseases',
                      icon: Icons.bug_report,
                      color: const Color(0xFF388E3C),
                      onTap: () {
                        // Navigate to disease detection
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildFeatureTile(
                      title: 'Gallery',
                      icon: Icons.photo_library,
                      color: const Color(0xFF43A047),
                      onTap: () {
                        // Navigate to gallery
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    bool isLarge = false,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(16),
      elevation: 4,
      shadowColor: Colors.black26,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLarge) ...[
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.flight,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Icon(
                  icon,
                  size: 48,
                  color: Colors.white,
                ),
              ] else
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: isLarge ? 20 : 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
