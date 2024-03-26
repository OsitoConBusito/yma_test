import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yma_test/theme/colors.dart';
import 'package:yma_test/theme/images.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YMA Test App',
      color: Colors.white,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 78,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: AppColors.lightGrey,
                height: 1,
              ),
            ),
            leading: const Icon(
              Icons.chevron_left,
              color: AppColors.grey,
              size: 32,
            ),
            title: SvgPicture.asset(AppImages.logo),
            centerTitle: true,
          ),
          body: Stack(
            children: <Widget>[
              SvgPicture.asset(
                AppImages.background,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
