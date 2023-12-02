import 'package:flutter/material.dart';
import 'package:my_store/MVVM/views/CategoriesScreen/responsive_gridview.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/custom_bottom_navigation.dart';
import 'package:my_store/utils/widgets/customtextfield.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5 * SizeConfig.heightMultiplier,
            ),
            Center(child: mtext('Categories')),
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            const CustomTextfield(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12 * SizeConfig.widthMultiplier,
                  vertical: 3 * SizeConfig.widthMultiplier),
              child: Align(alignment: Alignment.centerLeft, child: ctext()),
            ),
            SizedBox(
              height: 0.1 * SizeConfig.heightMultiplier,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return buildgridView(constraints.maxWidth);
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigation(),
    );
  }
}
