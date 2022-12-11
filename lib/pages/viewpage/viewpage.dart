import 'package:flutter/material.dart';
import 'package:rentapp/pages/viewpage/topbar.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            TopBar(),
          ],
        ),
      ),
    );
  }
}
