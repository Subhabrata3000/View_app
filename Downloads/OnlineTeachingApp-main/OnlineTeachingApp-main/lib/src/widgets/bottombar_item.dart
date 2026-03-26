import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
    this.icon, {
    super.key,
    this.onTap,
    this.color = const Color(0xFF424242), // Dark gray/black for icons
    this.activeColor = const Color(0xFF1E8E3E), // Emerald green for active
    this.isActive = false,
    this.isNotified = false,
    required this.title,
  });

  final String title;
  final String icon;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isSvg = icon.toLowerCase().endsWith('.svg');

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon with background - changes based on active state
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // ✅ Active: semi-transparent white, Inactive: off-white
                  color: isActive 
                      ? Colors.white.withOpacity(0.25) 
                      : const Color(0xFFFAFAFA),
                  // ✅ Remove border - not needed with background contrast
                ),
                child: isSvg
                    ? SvgPicture.asset(
                        icon,
                        colorFilter: ColorFilter.mode(
                          isActive ? activeColor : color,
                          BlendMode.srcIn,
                        ),
                        width: 22,
                        height: 22,
                      )
                    : Image.asset(
                        icon,
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                        color: isActive ? activeColor : color,
                      ),
              ),
              
              const SizedBox(height: 6),
              
              // Label text
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isActive ? activeColor : color,
                    fontSize: 11,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================
// LIGHT GREEN BOTTOM NAVIGATION BAR
// ========================================
class LightGreenBottomNavBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final int currentIndex;

  const LightGreenBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 20, // Space from system nav bar
      ),
      height: 72, // Fixed height
      decoration: BoxDecoration(
        // Light green background
        color: const Color(0xFFE8ECF9), // Light emerald green from your theme
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ),
      ),
    );
  }
}
