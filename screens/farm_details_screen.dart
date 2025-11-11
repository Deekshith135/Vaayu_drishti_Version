import 'package:flutter/material.dart';

class FarmDetailsScreen extends StatefulWidget {
  const FarmDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FarmDetailsScreen> createState() => _FarmDetailsScreenState();
}

class _FarmDetailsScreenState extends State<FarmDetailsScreen> {
  final TextEditingController _landAreaController = TextEditingController(text: '3.5 acres');
  final TextEditingController _cropTypeController = TextEditingController(text: 'Paddy, Groundnut, Maize');
  final TextEditingController _numberOfCropsController = TextEditingController(text: '2');
  final TextEditingController _yieldDateController = TextEditingController(text: '15 March 2025');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE9F8EB), Color(0xFFCFEFD3)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Title
                const Text(
                  'Enter Farm Details',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2D1F),
                  ),
                ),
                const SizedBox(height: 32),
                // Input cards
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildInputCard(
                          label: 'Land Area (in acres)',
                          controller: _landAreaController,
                          icon: Icons.landscape,
                        ),
                        const SizedBox(height: 16),
                        _buildInputCard(
                          label: 'Crop Type',
                          controller: _cropTypeController,
                          icon: Icons.agriculture,
                          suffixIcon: Icons.arrow_drop_down,
                        ),
                        const SizedBox(height: 16),
                        _buildInputCard(
                          label: 'Number of Crops Grown',
                          controller: _numberOfCropsController,
                          icon: Icons.format_list_numbered,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        _buildInputCard(
                          label: 'Expected Yield Date',
                          controller: _yieldDateController,
                          icon: Icons.calendar_today,
                          suffixIcon: Icons.calendar_month,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );
                            if (date != null) {
                              _yieldDateController.text = 
                                '${date.day} ${_getMonthName(date.month)} ${date.year}';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Bottom actions
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF2E7D32)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to next
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    IconData? suffixIcon,
    TextInputType? keyboardType,
    VoidCallback? onTap,
  }) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF4F6A50),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            readOnly: onTap != null,
            onTap: onTap,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Color(0xFF2E7D32), size: 20),
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: Color(0xFF4F6A50))
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1F2D1F),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}
