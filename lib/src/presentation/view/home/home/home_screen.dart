import 'package:flutter/material.dart';

import 'package:machine_test/src/presentation/view/home/home/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar());
  }
}
