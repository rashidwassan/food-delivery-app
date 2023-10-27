import 'package:flutter/material.dart';

class MainBorderedMultilineTextField extends StatelessWidget {
  const MainBorderedMultilineTextField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.height,
    this.hintText = "",
    this.maxLines = 1,
    this.validator,
  });

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final String hintText;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: height != null
          ? SizedBox(
              height: height,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  validator: validator,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(),
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                maxLines: maxLines,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(),
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
    );
  }
}

class MainBorderedTextField extends StatelessWidget {
  const MainBorderedTextField(
      {super.key,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.hintText = "",
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.isObscure = false,
      this.enabled = true});

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: 1,
        obscureText: isObscure,
        decoration: InputDecoration(
          enabled: enabled,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Icon(
                    prefixIcon,
                    size: 25,
                  ),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: suffixIcon,
                )
              : null,
        ),
      ),
    );
  }
}
