import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  const RoundedImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: cs.onPrimary.withOpacity(0.3), // ✅ White border on green appbar
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - 2),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    cs.secondary, // ✅ Golden
                    cs.secondary.withOpacity(0.7),
                  ],
                ),
              ),
              child: Icon(
                Icons.person,
                color: cs.onSecondary, // ✅ Green on golden
                size: 24,
              ),
            );
          },
        ),
      ),
    );
  }
}
