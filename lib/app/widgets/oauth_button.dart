import '../enums/enums.dart';
import '../../core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton(
      {super.key,
      required this.onPressed,
      required this.type,
      required this.label});
  final VoidCallback onPressed;
  final Enum type;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: const Color(0xff030E4F),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (type == ButtonType.google)
            Image.asset(
              "assets/images/google.png",
              width: 30,
            ),
          if (type == ButtonType.facebook)
            Image.asset(
              "assets/images/facebook.png",
              width: 30,
            ),
          const SizedBox(
            width: 18,
          ),
          TextWidget(
            text: label,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
