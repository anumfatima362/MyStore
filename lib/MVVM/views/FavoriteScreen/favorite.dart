import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/custom_bottom_navigation.dart';
import 'package:my_store/utils/widgets/customtextfield.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
            Center(child: mtext('Favourites')),
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            CustomTextfield(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12 * SizeConfig.widthMultiplier,
                  vertical: 3 * SizeConfig.widthMultiplier),
              child: Align(alignment: Alignment.centerLeft, child: ctext()),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5 * SizeConfig.widthMultiplier),
                  child: Card(
                    elevation: 0.1,
                    child: Container(
                      height: 110,
                      width: 12 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.grey.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5 * SizeConfig.widthMultiplier),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/smartphone_ads.png'),
                                    radius: 35,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Iphone 9',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        '\$60',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.9',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                              width: 2 *
                                                  SizeConfig.widthMultiplier),
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
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              ),
                            ]),
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigation(),
    );
  }
}
