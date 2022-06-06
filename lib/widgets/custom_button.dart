import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function onClick;
  const CustomButton(
      {Key? key,
      required this.label,
      required this.onClick,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
      icon: icon,
      label: Text(label),
      onPressed: () {
        onClick();
      },
    );
  }
}
