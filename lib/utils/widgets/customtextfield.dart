import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5 * SizeConfig.heightMultiplier,
      width: 88 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        decoration: InputDecoration(
            label: const Text('iphone'),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                // ignore: deprecated_member_use
              ),
            )),
      ),
    );
  }
}
