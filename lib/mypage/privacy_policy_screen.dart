import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFA724)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '개인정보 처리방침',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Text(
            '''Map-mo!는 개인정보 보호법 및 기타 관련법률에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련된 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리 방침을 두고 있습니다.

Map-mo!는 개인정보 보호법 및 기타 관련법률에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련된 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리 방침을 두고 있습니다.

Map-mo!는 개인정보 보호법 및 기타 관련법률에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련된 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리 방침을 두고 있습니다.
''',
            style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.8),
          ),
        ),
      ),
    );
  }
}
