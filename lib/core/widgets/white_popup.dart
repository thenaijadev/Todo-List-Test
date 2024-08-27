import 'package:flutter/material.dart';

class BrownPopup extends StatelessWidget {
  const BrownPopup({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }
}

void showWhitePopup({required BuildContext context, required Widget widget}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => BrownPopup(
      child: widget,
    ),
  );
}
