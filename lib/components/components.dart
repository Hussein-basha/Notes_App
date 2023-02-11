import 'package:flutter/material.dart';

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required Function validate,
  required IconData prefix,
  String hint = 'Search',
  bool isClickable = true,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onTap: () {
        onTap!();
      },
      onFieldSubmitted: (String? value) {
        onSubmit!(value);
      },
      onChanged: (String? value) {
        onChange!(value);
      },
      validator: (value) {
        return validate(value);
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          prefix,
        ),
        border: const OutlineInputBorder(),
      ),
    );
