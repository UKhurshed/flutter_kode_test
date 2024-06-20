import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kode_test/screens/employees/cubit/get_employee_cubit.dart';
import 'package:flutter_kode_test/utils/result/result_builder_impl.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetEmployeeCubit(usersRepository: context.read<UsersRepository>())
            ..getEmployees(),
      child: const _EmployeesView(),
    );
  }
}

class _EmployeesView extends StatefulWidget {
  const _EmployeesView();

  @override
  State<_EmployeesView> createState() => _EmployeesViewState();
}

class _EmployeesViewState extends State<_EmployeesView> {
  @override
  Widget build(BuildContext context) {
    final employeesResult =
        context.select((GetEmployeeCubit cubit) => cubit.state.employees);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TextFieldSearch(),
                const SizedBox(height: 16),
                ResultBuilderImpl(
                  result: employeesResult,
                  loadingBuilder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  successBuilder: (BuildContext context, List<Employee> data) {
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 80,
                            child: Center(
                              child: Text(data[index].firstName),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 4);
                        },
                        itemCount: data.length);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Введите имя, тег, почту...',
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
