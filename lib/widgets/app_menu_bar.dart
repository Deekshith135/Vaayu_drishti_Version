import 'package:flutter/material.dart';

class AppMenuBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String? currentRoute;

  const AppMenuBar({
    Key? key,
    required this.title,
    this.currentRoute,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<AppMenuBar> createState() => _AppMenuBarState();
}

class _AppMenuBarState extends State<AppMenuBar> {
  String? _hoveredMenu;

  // Define menu structure
  final Map<String, List<Map<String, String>>> _menuStructure = {
    'Authentication': [
      {'title': 'Onboarding', 'route': '/onboarding'},
      {'title': 'Login', 'route': '/login'},
      {'title': 'Create Account', 'route': '/create-account'},
      {'title': 'Welcome', 'route': '/welcome'},
    ],
    'Farm Setup': [
      {'title': 'Farm Details', 'route': '/farm-details'},
      {'title': 'Choose Plan (List)', 'route': '/choose-plan-list'},
      {'title': 'Choose Plan (Premium)', 'route': '/choose-plan-premium'},
    ],
    'Crop Management': [
      {'title': 'Crop Selection', 'route': '/crop-selection'},
      {'title': 'Collecting Images', 'route': '/collecting-images'},
      {'title': 'Coconut Hub', 'route': '/coconut-hub'},
    ],
    'Health Analysis': [
      {'title': 'Health Summary', 'route': '/health-summary'},
      {'title': 'Disease Details', 'route': '/disease-details'},
      {'title': 'Disease Breakdown', 'route': '/disease-breakdown'},
      {'title': 'Stem Bleeding Analysis', 'route': '/stem-analysis'},
    ],
    'Support': [
      {'title': 'Expert Connect', 'route': '/expert-connect'},
      {'title': 'Thank You', 'route': '/thank-you'},
    ],
  };

  bool _isMenuActive(String menuTitle) {
    final items = _menuStructure[menuTitle] ?? [];
    return items.any((item) => item['route'] == widget.currentRoute);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF2E7D32),
      elevation: 2,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          // Back button on far left
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
            tooltip: 'Back',
          ),
          // Menu buttons on left side
          ..._menuStructure.keys.map((menuTitle) {
            final isActive = _isMenuActive(menuTitle);
            final isHovered = _hoveredMenu == menuTitle;
            
            return _buildMenuButton(
              context,
              menuTitle,
              _menuStructure[menuTitle]!,
              isActive,
              isHovered,
            );
          }).toList(),
          const Spacer(),
          // Page title on right
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    List<Map<String, String>> items,
    bool isActive,
    bool isHovered,
  ) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredMenu = title),
      onExit: (_) => setState(() => _hoveredMenu = null),
      child: PopupMenuButton<String>(
        onSelected: (String route) {
          Navigator.pushNamed(context, route);
        },
        offset: const Offset(0, 45),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8,
        itemBuilder: (BuildContext context) {
          return items.map((item) {
            final isCurrentRoute = item['route'] == widget.currentRoute;
            return PopupMenuItem<String>(
              value: item['route'],
              height: 48,
              child: Container(
                decoration: BoxDecoration(
                  color: isCurrentRoute ? const Color(0xFFE8F5E9) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      isCurrentRoute ? Icons.check_circle : Icons.circle,
                      size: isCurrentRoute ? 16 : 8,
                      color: const Color(0xFF2E7D32),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item['title']!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isCurrentRoute ? FontWeight.w600 : FontWeight.w500,
                          color: isCurrentRoute ? const Color(0xFF2E7D32) : const Color(0xFF1F2D1F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF1B5E20)
                : isHovered
                    ? const Color(0xFF388E3C)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
