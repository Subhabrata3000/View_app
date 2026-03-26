import 'package:flutter/material.dart';
import 'package:online_course/src/widgets/icon_box.dart';

class MyCourseAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  const MyCourseAppBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Courses",
                style: TextStyle(
                  color: Colors.white, // ✅ White text on emerald header
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFF8A00), // ✅ Golden Yellow button
            borderRadius: BorderRadius.circular(10), // ✅ 10dp rounded
          ),
          child: IconBox(
            onTap: () {
              onPressed();
            },
            bgColor: Colors.transparent,
            child: const Icon(
              Icons.refresh_outlined,
              color: Color(0xFF1E8E3E), // ✅ Emerald icon on golden button
            ),
          ),
        )
      ],
    );
  }
}
