import 'package:flutter/material.dart';
import 'package:synapsis_test/core/theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.prefixSection,
    this.suffixSection,
    required this.controller,
    this.hint,
  }) : super(key: key);

  final Widget? prefixSection;
  final Widget? suffixSection;
  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
        border: Border.all(
          width: 2,
          color: primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixSection != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: prefixSection,
                )
              : const SizedBox(),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: heading2Style,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: heading2Style.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          suffixSection != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: suffixSection,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
