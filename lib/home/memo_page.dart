import 'package:flutter/material.dart';

class MemoPage extends StatelessWidget {
  const MemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("메모 페이지")),
      body: const Center(
        child: Text("메모 페이지 내용"),
      ),
    );
  }
}
