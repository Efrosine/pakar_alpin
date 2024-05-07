import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FloatButton extends StatelessWidget {
  const FloatButton(
      {super.key, this.rightPostIcon = false, required this.label, required this.icon, this.onPressed});

  final void Function()? onPressed;
  final IconData icon;
  final String label;
  final bool rightPostIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (rightPostIcon) ...[
                Text(label),
                const Gap(8),
              ],
              Icon(icon),
              if (!rightPostIcon) ...[
                const Gap(8),
                Text(label),
              ],
            ],
          )),
    );
  }
}
