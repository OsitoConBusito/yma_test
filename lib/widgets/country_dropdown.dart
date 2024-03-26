import 'package:flutter/material.dart';
import 'package:yma_test/models/country.dart';
import 'package:yma_test/theme/colors.dart';
import 'package:yma_test/theme/json_files.dart';
import 'package:yma_test/widgets/country_content.dart';
import 'package:yma_test/widgets/country_menu.dart';

class CountryDropDown extends StatefulWidget {
  const CountryDropDown({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  State<StatefulWidget> createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CountryDropDown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();

  double? _buttonWidth;
  CountryModel? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: 0.3,
                child: ModalBarrier(
                  dismissible: true,
                  color: AppColors.grey,
                  onDismiss: onTap,
                ),
              ),
              CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.topLeft,
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString(JsonFiles.countries),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return CountryMenu(
                        hint: widget.hint,
                        width: _buttonWidth,
                        data: countryModelFromJson(snapshot.data!),
                        onSelect: (value) {
                          onTap();
                          setState(() {
                            selectedCountry = value;
                          });
                        },
                      );
                    } else {
                      return Text('Error');
                    }
                  },
                ),
              ),
            ],
          );
        },
        child: CountryContent(
          onTap: onTap,
          selectedCountry: selectedCountry,
        ),
      ),
    );
  }

  void onTap() {
    _buttonWidth = context.size?.width;
    _tooltipController.toggle();
  }
}
