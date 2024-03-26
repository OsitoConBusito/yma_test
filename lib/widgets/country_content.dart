import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yma_test/models/country.dart';
import 'package:yma_test/theme/colors.dart';
import 'package:yma_test/widgets/country_button.dart';

class CountryContent extends StatelessWidget {
  const CountryContent({
    super.key,
    this.onTap,
    this.selectedCountry,
  });

  final VoidCallback? onTap;
  final CountryModel? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return CountryButton(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: AppColors.extraLightGrey,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 7),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedCountry?.country ?? '🌎 Todo el mundo',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            Transform.rotate(
              angle: -pi / 2,
              child: Icon(
                Icons.chevron_left,
                color: AppColors.iconGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
