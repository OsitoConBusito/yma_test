import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:yma_test/theme/colors.dart';
import 'package:yma_test/theme/images.dart';
import 'package:yma_test/theme/spacing.dart';
import 'package:yma_test/widgets/country_dropdown.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YMA Test App',
      home: Container(
        color: Colors.white,
        child: SafeArea(
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
              backgroundColor: Colors.white,
            ),
            body: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  AppImages.background,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    Gap(Spacing.large),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Spacing.medium),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Yomeanimers',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Gap(Spacing.xxSmall),
                                CountryDropDown(
                                  hint: 'Buscando Yomeanimers de:',
                                ),
                              ],
                            ),
                          ),
                          Gap(12),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Destino',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Gap(Spacing.xxSmall),
                                CountryDropDown(
                                  hint:
                                      'Buscando Yomeanimers que viajan o están en:',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(32),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 37),
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            height: 75,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              AppImages.picturePng,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -5,
                                          right: 0,
                                          child: SvgPicture.asset(
                                            AppImages.flag,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(25),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Usuario ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: AppColors.grey),
                                              ),
                                              Gap(5),
                                              SvgPicture.asset(
                                                  AppImages.verified),
                                            ],
                                          ),
                                          Text(
                                            'Nacionalidad, XX años',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: AppColors.grey),
                                          ),
                                          Text(
                                            'En Ciudad, País',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: AppColors.iconGrey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(12),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Transform.rotate(
                                          angle: pi / 4,
                                          child: Transform.translate(
                                            offset: Offset(0, 7),
                                            child: Container(
                                              color: AppColors.contentGrey,
                                              height: 10,
                                              width: 10,
                                            ),
                                          ),
                                        ),
                                        Spacer(
                                          flex: 8,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 147,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.contentGrey,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            Text(
                                              '¡Saludos desde los Países Bajos! Mi nombre es Mili y estoy emocionada de formar parte de esta increíble com...',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: AppColors.grey,
                                              ),
                                            ),
                                            Gap(10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 24,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.burgundy,
                                                        width: 1),
                                                  ),
                                                  child: Text(
                                                    'busco alojamiento',
                                                    style: TextStyle(
                                                      color: AppColors.burgundy,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 24,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.burgundy,
                                                        width: 1),
                                                  ),
                                                  child: Text(
                                                    'recién llegado',
                                                    style: TextStyle(
                                                      color: AppColors.burgundy,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        color: AppColors.contentGrey,
                                      ),
                                      child: Transform.rotate(
                                        angle: -pi / 2,
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: AppColors.iconGrey,
                                        ),
                                      ),
                                    ),
                                    Gap(4),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 21),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10),
                                            child: SvgPicture.asset(
                                              AppImages.plane,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'YoMeAnimer próximo a viajar a Alemania',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: AppColors.green),
                                                ),
                                                Text(
                                                  'El 05/06/2023',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12,
                                                    color: AppColors.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -35,
                          left: 0,
                          right: 0,
                          child: SvgPicture.asset(AppImages.hand),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.iconGrey, width: 0.5),
                ),
              ),
              child: BottomNavigationBar(
                showUnselectedLabels: true,
                unselectedItemColor: AppColors.iconGrey,
                unselectedFontSize: 10,
                selectedFontSize: 10,
                selectedItemColor: AppColors.green,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.profile),
                    label: 'Buscar',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.news),
                    label: 'Novedades',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.messages),
                    label: 'Mensajes',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppImages.picturePng,
                      height: 22,
                      width: 22,
                    ),
                    label: 'Perfil',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
