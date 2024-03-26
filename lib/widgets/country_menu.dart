import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yma_test/models/country.dart';
import 'package:yma_test/theme/colors.dart';
import 'package:yma_test/widgets/country_content.dart';

class CountryMenu extends StatelessWidget {
  const CountryMenu({
    required this.data,
    required this.width,
    super.key,
    required this.onSelect,
    required this.hint,
  });

  final double? width;
  final List<CountryModel> data;
  final void Function(CountryModel?) onSelect;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: MediaQuery.sizeOf(context).height * 0.7,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Column(
          children: [
            CountryContent(),
            Gap(4),
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                hint,
                style: TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: AppColors.extraLightGrey,
            ),
            Gap(10),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => onSelect(data[index]),
                    child: ListTile(
                      title: Text(
                        data[index].country,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
