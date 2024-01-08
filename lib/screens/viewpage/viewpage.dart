import 'package:flutter/material.dart';
import 'package:rentapp/screens/viewpage/topbar.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: Column(
            children: [
              TopBar(),
            ],
          ),
        ),
      ),
    );
  }
}
