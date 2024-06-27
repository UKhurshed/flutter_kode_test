import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kode_test/screens/detail_employee_info/widgets/widgets.dart';
import 'package:flutter_kode_test/utils/s.dart';
import 'package:go_router/go_router.dart';

class DetailEmployeeInfoPage extends StatelessWidget {
  const DetailEmployeeInfoPage(
      {super.key,
      required this.avatarUrl,
      required this.fullName,
      required this.position,
      required this.birthday,
      required this.phone});

  final String avatarUrl;
  final String fullName;
  final String position;
  final String birthday;
  final String phone;

  static const routeName = 'detail_employee_info';

  @override
  Widget build(BuildContext context) {
    return _DetailEmployeeInfoView(
      avatarUrl: avatarUrl,
      phone: phone,
      fullName: fullName,
      birthday: birthday,
      position: position,
    );
  }
}

class _DetailEmployeeInfoView extends StatelessWidget {
  const _DetailEmployeeInfoView({
    required this.avatarUrl,
    required this.fullName,
    required this.position,
    required this.birthday,
    required this.phone,
  });

  final String avatarUrl;
  final String fullName;
  final String position;
  final String birthday;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F8),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFF7F7F8),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmployeeAvatarView(avatarUrl: avatarUrl),
            const SizedBox(height: 24),
            Text(fullName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Text(position,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF55555C),
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 24),
            _EmployeeInfoSection(
              birthday: birthday,
              phone: phone,
            )
          ],
        ),
      ),
    );
  }
}

class _EmployeeInfoSection extends StatelessWidget {
  const _EmployeeInfoSection({required this.birthday, required this.phone});

  final String phone;
  final String birthday;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Expanded(
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              EmployeeInfoCard(
                icon:
                    const Icon(Icons.star_border_outlined, color: Colors.black),
                title: formattedDate(birthday),
                birthdate: s.fullDate(
                    DateTime.now().year - DateTime.parse(birthday).year),
              ),
              Container(
                height: 1,
                color: Colors.black12,
              ),
              const SizedBox(height: 5),
              EmployeeInfoCard(
                icon: const Icon(Icons.phone, color: Colors.black),
                title: phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formattedDate(String birthDate) {
    final dateTime = DateTime.parse(birthDate);

    return '${dateTime.day} ${getMonth(dateTime.month)} ${dateTime.year}';
  }

  String getMonth(int month) {
    switch (month) {
      case 1:
        return "января";
      case 2:
        return "февраля";
      case 3:
        return "марта";
      case 4:
        return "апреля";
      case 5:
        return "мая";
      case 6:
        return "июня";
      case 7:
        return "июля";
      case 8:
        return "августа";
      case 9:
        return "сентября";
      case 10:
        return "октября";
      case 11:
        return "ноября";
      case 12:
        return "декабря";
      default:
        return "января";
    }
  }
}
