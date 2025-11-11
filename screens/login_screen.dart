import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCFEFD3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2D1F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Login / Verify Number',
          style: TextStyle(
            color: Color(0xFF1F2D1F),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // White card container
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Phone Number Input
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                      border: _hasError
                          ? Border.all(color: const Color(0xFFE74C3C), width: 2)
                          : null,
                    ),
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: '+1 234 567 890',
                        hintStyle: const TextStyle(color: Color(0xFFAAB8AD)),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color(0xFF2E7D32),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                  if (_hasError)
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please enter a valid phone number',
                          style: TextStyle(
                            color: Color(0xFFE74C3C),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  // OTP Input
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'OTP',
                        hintStyle: TextStyle(color: Color(0xFFAAB8AD)),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xFF2E7D32),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // SEND OTP Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate and send OTP
                        if (_phoneController.text.isEmpty) {
                          setState(() => _hasError = true);
                        } else {
                          setState(() => _hasError = false);
                          // Send OTP logic
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'SEND OTP',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // SIGN UP Link
            TextButton(
              onPressed: () {
                // Navigate to sign up
              },
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const Spacer(),
            // Footer
            const Text(
              'Powered by Farm Care',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFAAB8AD),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
