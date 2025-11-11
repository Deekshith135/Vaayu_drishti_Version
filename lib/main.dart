import 'package:flutter/material.dart';

// Import all screens
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/farm_details_screen.dart';
import 'screens/choose_plan_list_screen.dart';
import 'screens/choose_plan_premium_screen.dart';
import 'screens/crop_selection_screen.dart';
import 'screens/collecting_images_screen.dart';
import 'screens/coconut_crop_hub_screen.dart';
import 'screens/health_summary_screen.dart';
import 'screens/disease_details_screen.dart';
import 'screens/disease_breakdown_screen.dart';
import 'screens/stem_bleeding_analysis_screen.dart';
import 'screens/expert_connect_screen.dart';
import 'screens/thank_you_screen.dart';

void main() {
  runApp(const FarmDroneApp());
}

class FarmDroneApp extends StatelessWidget {
  const FarmDroneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Drone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2E7D32),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const FarmDroneHome(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/farm-details': (context) => const FarmDetailsScreen(),
        '/choose-plan-list': (context) => const ChoosePlanListScreen(),
        '/choose-plan-premium': (context) => const ChoosePlanPremiumScreen(),
        '/crop-selection': (context) => const CropSelectionScreen(),
        '/collecting-images': (context) => const CollectingImagesScreen(),
        '/coconut-hub': (context) => const CoconutCropHubScreen(),
        '/health-summary': (context) => const HealthSummaryScreen(),
        '/disease-details': (context) => const DiseaseDetailsScreen(),
        '/disease-breakdown': (context) => const DiseaseBreakdownScreen(),
        '/stem-analysis': (context) => const StemBleedingAnalysisScreen(),
        '/expert-connect': (context) => const ExpertConnectScreen(),
        '/thank-you': (context) => const ThankYouScreen(),
      },
    );
  }
}

class FarmDroneHome extends StatefulWidget {
  const FarmDroneHome({Key? key}) : super(key: key);

  @override
  State<FarmDroneHome> createState() => _FarmDroneHomeState();
}

class _FarmDroneHomeState extends State<FarmDroneHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        title: const Text(
          'Farm Drone',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          _buildMenuButton(
            context,
            'Authentication',
            [
              {'title': 'Onboarding', 'route': '/onboarding'},
              {'title': 'Login', 'route': '/login'},
              {'title': 'Create Account', 'route': '/create-account'},
              {'title': 'Welcome', 'route': '/welcome'},
            ],
          ),
          _buildMenuButton(
            context,
            'Farm Setup',
            [
              {'title': 'Farm Details', 'route': '/farm-details'},
              {'title': 'Choose Plan (List)', 'route': '/choose-plan-list'},
              {'title': 'Choose Plan (Premium)', 'route': '/choose-plan-premium'},
            ],
          ),
          _buildMenuButton(
            context,
            'Crop Management',
            [
              {'title': 'Crop Selection', 'route': '/crop-selection'},
              {'title': 'Collecting Images', 'route': '/collecting-images'},
              {'title': 'Coconut Hub', 'route': '/coconut-hub'},
            ],
          ),
          _buildMenuButton(
            context,
            'Health Analysis',
            [
              {'title': 'Health Summary', 'route': '/health-summary'},
              {'title': 'Disease Details', 'route': '/disease-details'},
              {'title': 'Disease Breakdown', 'route': '/disease-breakdown'},
              {'title': 'Stem Bleeding Analysis', 'route': '/stem-analysis'},
            ],
          ),
          _buildMenuButton(
            context,
            'Support',
            [
              {'title': 'Expert Connect', 'route': '/expert-connect'},
              {'title': 'Thank You', 'route': '/thank-you'},
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Onboarding & Authentication'),
          _buildScreenCard(context, '1. Onboarding / Hero', '/onboarding'),
          _buildScreenCard(context, '2. Login / Verify Number', '/login'),
          _buildScreenCard(context, '3. Create Account', '/create-account'),
          _buildScreenCard(context, '4. Welcome Screen', '/welcome'),
          const SizedBox(height: 20),
          _buildSectionHeader('Farm Setup & Plans'),
          _buildScreenCard(context, '5. Enter Farm Details', '/farm-details'),
          _buildScreenCard(context, '6. Choose Plan (List)', '/choose-plan-list'),
          _buildScreenCard(context, '7. Choose Plan (Premium)', '/choose-plan-premium'),
          const SizedBox(height: 20),
          _buildSectionHeader('Crop Management'),
          _buildScreenCard(context, '8. Crop Selection', '/crop-selection'),
          _buildScreenCard(context, '9. Collecting Images', '/collecting-images'),
          _buildScreenCard(context, '10. Coconut Crop Hub', '/coconut-hub'),
          const SizedBox(height: 20),
          _buildSectionHeader('Health & Disease Analysis'),
          _buildScreenCard(context, '11. Health Summary', '/health-summary'),
          _buildScreenCard(context, '12. Disease Details', '/disease-details'),
          _buildScreenCard(context, '13. Disease Breakdown', '/disease-breakdown'),
          _buildScreenCard(context, '14. Stem Bleeding Analysis', '/stem-analysis'),
          const SizedBox(height: 20),
          _buildSectionHeader('Support & Completion'),
          _buildScreenCard(context, '15. Expert Connect', '/expert-connect'),
          _buildScreenCard(context, '16. Thank You', '/thank-you'),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1F2D1F),
        ),
      ),
    );
  }

  Widget _buildScreenCard(BuildContext context, String title, String route) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2D1F),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Color(0xFF2E7D32),
        ),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, List<Map<String, String>> items) {
    return PopupMenuButton<String>(
      onSelected: (String route) {
        Navigator.pushNamed(context, route);
      },
      offset: const Offset(0, 50),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      itemBuilder: (BuildContext context) {
        return items.map((item) {
          return PopupMenuItem<String>(
            value: item['route'],
            child: Row(
              children: [
                const Icon(
                  Icons.circle,
                  size: 8,
                  color: Color(0xFF2E7D32),
                ),
                const SizedBox(width: 12),
                Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
