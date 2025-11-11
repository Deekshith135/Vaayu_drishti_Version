import 'package:flutter/material.dart';

class CollectingImagesScreen extends StatelessWidget {
  const CollectingImagesScreen({Key? key}) : super(key: key);

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
          'Collecting Field Images',
          style: TextStyle(
            color: Color(0xFF1F2D1F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Image grid placeholder
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9F8EB),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF2E7D32).withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 40,
                    color: Color(0xFF2E7D32),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            // Progress section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Processing Images',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2D1F),
                      ),
                    ),
                    Text(
                      '60% Complete',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 0.6,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFE9F8EB),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: const [
                    Icon(Icons.settings, color: Color(0xFF4F6A50), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Analyzing image data...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4F6A50),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
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
                      'The drone is capturing and analyzing images of your field.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1F2D1F),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
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
            const SizedBox(height: 12),
            const Text(
              'Powered by Farm Care',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFAAB8AD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
