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

class FarmDroneHome extends StatelessWidget {
  const FarmDroneHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        title: const Text(
          'Farm Drone - All Screens',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
}


