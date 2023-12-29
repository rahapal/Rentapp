import 'package:flutter/material.dart';
import 'package:rentapp/screens/viewpage/topbar.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: const SafeArea(
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
