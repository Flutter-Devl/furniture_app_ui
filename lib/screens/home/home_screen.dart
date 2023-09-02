import 'package:flutter/material.dart';
import 'package:furniture_app_ui/screens/home/components/body.dart';
import 'package:furniture_app_ui/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: Body());
  }
}
