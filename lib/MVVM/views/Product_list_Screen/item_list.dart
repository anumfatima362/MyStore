import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/helper/Routes_helper/route_helper.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/customtextfield.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                mtext('Smart Phones'),
              ],
            ),
          ),
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
          Expanded(
            child: ListView.builder(itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5 * SizeConfig.widthMultiplier,
                    vertical: 0.2 * SizeConfig.heightMultiplier),
                child: Card(
                  elevation: 0.5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouterHelper.product_details);
                    },
                    child: Container(
                      height: 40 * SizeConfig.heightMultiplier,
                      width: 20 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.1)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5 * SizeConfig.widthMultiplier),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 190,
                                // width: 325,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/smartphone_ads.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 3 * SizeConfig.heightMultiplier,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Iphone 14',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    '\$60',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '4.9',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(
                                      width: 2 * SizeConfig.widthMultiplier),
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
                              Text(
                                'By Apple',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightgrey,
                                ),
                              ),
                              SizedBox(
                                height: 2 * SizeConfig.heightMultiplier,
                              ),
                              Text(
                                'In smartphones',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              );
            })),
          )
        ]),
      ),
    );
  }
}
