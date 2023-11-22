import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.maxLines,
      this.onSaved,
      this.onChanged})
     ;

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
      onChanged: onChanged,
     
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Required Field';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 18,
        ),
        border: addBorderStyle(),
        enabledBorder: addBorderStyle(),
        focusedBorder: addBorderStyle(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder addBorderStyle([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kPrimaryColor),
    );
  }
}
