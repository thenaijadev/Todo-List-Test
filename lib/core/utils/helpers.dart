import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_test/core/widgets/primary_button.dart';

class Helpers {
  static void showCupertinoDatePicker(BuildContext context,
      DateTime selectedDate, Function(DateTime) onDateSelected) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 320, // Set a desired height for the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 250,
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDate) {
                    onDateSelected(newDate);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: PrimaryButton(
                    label: "Confirm", onPressed: () {}, isEnabled: true),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
