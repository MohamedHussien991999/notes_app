import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBarEdit extends StatelessWidget {
  const CustomAppBarEdit(
      {super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(
          flex: 1,
        ),
      
        CustomIcon(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
