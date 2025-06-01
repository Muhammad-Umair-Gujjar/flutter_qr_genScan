import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class QrInputField extends StatelessWidget {

  final TextEditingController controller;
  final VoidCallback onClear;
  final Function(String) onChanged;

  const QrInputField({super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Enter your text",
        prefixIcon: const Icon(Icons.text_fields_outlined),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
          icon: const Icon(Icons.clear),
          onPressed: onClear,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}