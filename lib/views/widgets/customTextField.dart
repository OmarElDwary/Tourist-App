import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String label;
  TextInputType keyboardType;
  TextEditingController? controller;
  bool obscureText;
  String? Function(String?)? validator;
  String? hintText;
  Icon? prefixIcon;
  int maxLines;
  Color? cursorColor;
  IconButton? suffixIcon;
  bool isPhoneNumber;

  CustomTextFormField(
      {super.key,
      this.label = '',
      this.keyboardType = TextInputType.text,
      this.controller,
      this.obscureText = false,
      this.validator,
      this.prefixIcon,
      this.hintText,
      this.maxLines = 1,
      this.cursorColor,
      this.suffixIcon,
      this.isPhoneNumber = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: isPhoneNumber
          ? InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {},
              textFieldController: controller,
              hintText: hintText,
              formatInput: false,
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
                leadingPadding: 10,
                setSelectorButtonAsPrefixIcon: true,
              ),
              inputDecoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 3,
                      color: Theme.of(context).primaryColor,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          : TextFormField(
              style: TextStyle(color: Colors.white),
              enableInteractiveSelection: true,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white),
                label: Text(
                  label,
                  style: TextStyle(color: Colors.white),
                ),
                hintText: hintText,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 3,
                      color: Theme.of(context).primaryColor,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              keyboardType: keyboardType,
              controller: controller,
              obscureText: obscureText,
              validator: validator,
            ),
    );
  }
}
