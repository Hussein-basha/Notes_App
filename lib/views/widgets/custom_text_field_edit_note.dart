import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomTextFieldEditNote extends StatelessWidget {
  const CustomTextFieldEditNote(
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
      initialValue: hint,
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
