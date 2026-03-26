import 'package:flutter/material.dart';

class RoundedBannerImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  const RoundedBannerImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageUrl.isEmpty
            ? Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      cs.primary, // ✅ Emerald
                      cs.primary.withOpacity(0.7),
                      cs.secondary, // ✅ Golden
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school,
                        size: 48,
                        color: cs.onPrimary.withOpacity(0.8),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'VIEW Institute',
                        style: TextStyle(
                          color: cs.onPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [cs.primary, cs.secondary],
                      ),
                    ),
                    child: Icon(
                      Icons.broken_image,
                      size: 48,
                      color: cs.onPrimary.withOpacity(0.5),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
