import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kode_test/screens/employees/cubit/get_employee_cubit.dart';
import 'package:flutter_kode_test/screens/employees/widgets/widgets.dart';
import 'package:flutter_kode_test/utils/default_shimmer.dart';
import 'package:flutter_kode_test/utils/result/result_builder_impl.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  static const routeName = 'employee';

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
      body: RefreshIndicator(
        onRefresh: () async =>
            await context.read<GetEmployeeCubit>().getEmployees(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              children: [
                const TextFieldSearch(),
                const SizedBox(height: 16),
                ResultBuilderImpl(
                  result: employeesResult,
                  loadingBuilder: (context) => const _EmployeeSectionShimmer(),
                  successBuilder: (BuildContext context, List<Employee> data) {
                    return Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return EmployeeItem(data: data[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 4);
                          },
                          itemCount: data.length),
                    );
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

class _EmployeeSectionShimmer extends StatelessWidget {
  const _EmployeeSectionShimmer();

  @override
  Widget build(BuildContext context) {
    return DefaultShimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: SizedBox(
                        height: 72,
                        width: 72,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50)),
                            child: const SizedBox(height: 16, width: 144)),
                        const SizedBox(height: 6),
                        DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50)),
                            child: const SizedBox(height: 12, width: 80)),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemCount: 6),
      ),
    );
  }
}
