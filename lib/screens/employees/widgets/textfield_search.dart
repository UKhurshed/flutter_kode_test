import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kode_test/screens/employees/cubit/get_employee_cubit.dart';
import 'package:flutter_kode_test/utils/s.dart';

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({super.key});

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  late final TextEditingController _controller;
  final focusNode = FocusNode();

  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFF7F7F8)));

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(searchTextFieldListener);
  }

  searchTextFieldListener() {
    context
        .read<GetEmployeeCubit>()
        .setTextFieldStatus(_controller.text.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Focus(
        child: Builder(
          builder: (context) {
            final bool hasFocus = Focus.of(context).hasFocus;
            return Row(
              children: [
                Expanded(
                  child: BlocBuilder<GetEmployeeCubit, GetEmployeeState>(
                    builder: (context, state) {
                      return TextField(
                        controller: _controller,
                        focusNode: focusNode,
                        onChanged: (value) {
                          context
                              .read<GetEmployeeCubit>()
                              .filterEmployee(value);
                        },
                        decoration: InputDecoration(
                            hintText: s.textFieldPlaceholder,
                            hintStyle:
                                const TextStyle(color: Color(0xFFC3C3C6)),
                            fillColor: const Color(0xFFF7F7F8),
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            prefixIcon: _SearchPrefixIcon(hasFocus: hasFocus),
                            suffixIcon: _SearchTextFieldSuffixIcon(
                                hasFocus: state.isEmptyTextField,
                                focusNode: focusNode,
                                controller: _controller),
                            border: border,
                            errorBorder: border,
                            enabledBorder: border,
                            focusedBorder: border),
                      );
                    },
                  ),
                ),
                hasFocus
                    ? TextButton(
                        onPressed: () {
                          focusNode.unfocus();
                          _controller.clear();
                          context.read<GetEmployeeCubit>().clearState();
                        },
                        child: Text(s.cancel))
                    : const SizedBox.shrink()
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(searchTextFieldListener);
    _controller.dispose();
    super.dispose();
  }
}

class _SearchPrefixIcon extends StatelessWidget {
  const _SearchPrefixIcon({required this.hasFocus});

  final bool hasFocus;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      color: hasFocus ? Colors.black : const Color(0xFFC3C3C6),
      size: 28,
    );
  }
}

class _SearchTextFieldSuffixIcon extends StatelessWidget {
  const _SearchTextFieldSuffixIcon(
      {required this.hasFocus,
      required this.focusNode,
      required this.controller});

  final bool hasFocus;
  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return hasFocus
        ? const Icon(
            Icons.filter_list,
            color: Color(0xFFC3C3C6),
            size: 28,
          )
        : InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              controller.clear();
              context.read<GetEmployeeCubit>().clearState();
              focusNode.unfocus();
            },
            child: const Icon(
              Icons.cancel_outlined,
              size: 20,
              color: Color(0xFFC3C3C6),
            ),
          );
  }
}
