import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final isEnabled;
  const GradientButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        decoration: BoxDecoration(
          color: isEnabled ? const Color(0xFF161616) : Colors.black45,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: !isEnabled
              ? null
              : [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    offset: const Offset(0, 8),
                    blurRadius: 10.0,
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: Colors.red.withOpacity(0.4),
                    offset: const Offset(0, 8),
                    blurRadius: 10.0,
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.2),
                    offset: const Offset(0, 8),
                    blurRadius: 10.0,
                    spreadRadius: 2,
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
