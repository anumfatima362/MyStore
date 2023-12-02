import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/helper/Routes_helper/route_helper.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';

Widget buildgridView(double width) {
  int crossAxisCount = calculateCrossAxisCount(width);
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:
            200, // Adjust this value to control item aspect ratio
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 2.0,
        childAspectRatio: 1.0, // Adjust this value to control item aspect ratio
      ),
      itemBuilder: (context, index) {
        return buildgridle(context);
      });
}

Widget buildgridle(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, RouterHelper.itemlist);
    },
    child: Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
          // color: Colors.blue,
          image: DecorationImage(
              image: const AssetImage(
                'assets/images/smartphone_ads.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              )),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: EdgeInsets.only(
          left: 3 * SizeConfig.widthMultiplier,
          top: 15 * SizeConfig.heightMultiplier,
        ),
        child: Text(
          'SmartPhones',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    ),
  );
}

int calculateCrossAxisCount(double width) {
  // Calculate the number of items per row based on screen width
  int crossAxisCount = (width / 200).floor(); // Adjust item width as needed
  return crossAxisCount;
}
