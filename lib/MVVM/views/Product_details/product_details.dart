import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 2 * SizeConfig.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5 * SizeConfig.widthMultiplier),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset('assets/icons/back_arrow.svg')),
                  SizedBox(
                    width: 18 * SizeConfig.widthMultiplier,
                  ),
                  mtext('Product Details'),
                ],
              ),
            ),
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            Container(
              height: 209,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/images/smartphone_ads.png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 4 * SizeConfig.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 3 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Details:',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset('assets/icons/like.svg'),
                    ],
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    children: [
                      bText('Name:'),
                      SizedBox(
                        width: 1 * SizeConfig.widthMultiplier,
                      ),
                      sText('iphone 9'),
                    ],
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    children: [
                      bText('Price :'),
                      SizedBox(
                        width: 1 * SizeConfig.widthMultiplier,
                      ),
                      sText('\$60'),
                    ],
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    children: [
                      bText('Category :'),
                      SizedBox(
                        width: 1 * SizeConfig.widthMultiplier,
                      ),
                      sText('smartphones'),
                    ],
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    children: [
                      bText('Brand :'),
                      SizedBox(
                        width: 1 * SizeConfig.widthMultiplier,
                      ),
                      sText('Apple'),
                    ],
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    children: [
                      bText('Rating :'),
                      SizedBox(
                        width: 1 * SizeConfig.widthMultiplier,
                      ),
                      RatingBar.builder(
                          initialRating:
                              5, // Set the initial rating (you can change this value)
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 12,
                          itemBuilder: (context, _) {
                            return const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            );
                          },
                          onRatingUpdate: (rating) {})
                    ],
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    children: [
                      bText('Stock :'),
                      SizedBox(
                        width: 1 * SizeConfig.widthMultiplier,
                      ),
                      sText('45'),
                    ],
                  ),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  bText('Description :'),
                  SizedBox(
                    height: 0.5 * SizeConfig.heightMultiplier,
                  ),
                  sText(
                      'Lorem Ipsum är en utfyllnadstext från tryck- och förlagsindustrin. Lorem ipsum har varit standard ända.'),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  bText('Product Gallery :'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget bText(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
  );
}

Widget sText(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
  );
}
