import 'package:flutter/material.dart';
import 'package:flutter_kode_test/utils/s.dart';

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({super.key});

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  final TextEditingController controller = TextEditingController();

  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFF7F7F8)));

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: s.textFieldPlaceholder,
            hintStyle: const TextStyle(color: Color(0xFFC3C3C6)),
            fillColor: const Color(0xFFF7F7F8),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xFFC3C3C6),
              size: 28,
            ),
            suffixIcon: const Icon(
              Icons.filter_list,
              color: Color(0xFFC3C3C6),
              size: 28,
            ),
            border: border,
            errorBorder: border,
            enabledBorder: border,
            focusedBorder: border),
      ),
    );
  }
}
