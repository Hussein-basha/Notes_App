import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class CustomTextFieldAddNote extends StatelessWidget {
  const CustomTextFieldAddNote(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSave,
      this.onChange,
      this.label});

  final String hint;
  final int maxLines;
  final String? label;
  final void Function(String?)? onSave;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onSaved: onSave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field Is Required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
