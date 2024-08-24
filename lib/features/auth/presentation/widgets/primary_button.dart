import 'package:flutter/material.dart';
import 'package:todo_list_test/core/widgets/text_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.label,
      this.labelFontSize = 18,
      required this.onPressed,
      required this.isEnabled,
      this.labelColor = Colors.white,
      this.icon = const TextWidget(text: ""),
      this.fontWeight = FontWeight.w600,
      this.isOutlined = false});
  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  final Widget icon;
  final bool isOutlined;
  final Color labelColor;
  final FontWeight fontWeight;
  final double labelFontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: TextWidget(
          text: label,
          color:
              isOutlined ? Theme.of(context).colorScheme.primary : labelColor,
          fontSize: labelFontSize,
          fontWeight: fontWeight,
        ),
      ),
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
                width: 1,
                color: Theme.of(context)
                    .colorScheme
                    .primary) // Set border radius to 10
            ),
        backgroundColor: isOutlined
            ? Colors.transparent
            : Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
