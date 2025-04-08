import 'package:flutter/material.dart';

class EditNicknameScreen extends StatefulWidget {
  const EditNicknameScreen({super.key});

  @override
  State<EditNicknameScreen> createState() => _EditNicknameScreenState();
}

class _EditNicknameScreenState extends State<EditNicknameScreen> {
  final _controller = TextEditingController();
  bool _isError = false;
  bool _isInputValid = false;

  void _validateAndSubmit() {
    final text = _controller.text.trim();
    if (text.length < 2 || text.length > 10) {
      setState(() {
        _isError = true;
      });
    } else {
      setState(() {
        _isError = false;
      });
      // TODO: 서버에 닉네임 저장 로직
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text.trim();
      setState(() {
        // ✅ 1자 이상이면 버튼 활성화
        _isInputValid = text.length >= 1;

        // ❌ 에러 메시지는 2~10자 아니면 표시
        _isError = text.isNotEmpty && (text.length < 2 || text.length > 10);
      });
    });
  }

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
          '닉네임 변경',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              '새로운 닉네임을 입력해주세요.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(thickness: 1, color: Colors.black),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '새로운 닉네임',
                hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(
                    color: _isError ? Colors.red : const Color(0xFFE0E0E0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(
                    color: _isError ? Colors.red : const Color(0xFFFFA724),
                  ),
                ),
              ),
            ),
            if (_isError) ...[
              const SizedBox(height: 8),
              const Text(
                '닉네임을 2~10자로 입력해주세요.',
                style: TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _isInputValid ? _validateAndSubmit : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  backgroundColor: _isInputValid ? const Color(0xFFFFA724) : const Color(0xFFBDBDBD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  '변경하기',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
