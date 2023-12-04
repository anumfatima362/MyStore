import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/MVVM/viewModels/classModels/category_detail_model.dart';
import 'package:my_store/MVVM/viewModels/services/api_services.dart';
import 'package:my_store/MVVM/views/Product_details/product_details.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/customtextfield.dart';

class ItemList extends StatefulWidget {
  final String categoryName;

  const ItemList({super.key, required this.categoryName});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                mtext(widget.categoryName.toUpperCase()),
              ],
            ),
          ),
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          CustomTextfield(),
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          Container(
            height: 18,
            width: 80 * SizeConfig.widthMultiplier,
            decoration: const BoxDecoration(
                // color: Colors.black12,
                ),
            child: ctext(),
          ),
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          Expanded(
            child: FutureBuilder(
                future: ApiServices.fetchCategoryDetail(widget.categoryName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.hasError}');
                  } else if (snapshot.data == null) {
                    return const Text('No data is Available');
                  } else {
                    CategoryDetailModel categoryDetail = snapshot.data!;
                    return ListView.builder(
                        itemCount: categoryDetail.products!.length,
                        itemBuilder: ((context, index) {
                          Product product = categoryDetail.products![index];

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5 * SizeConfig.widthMultiplier,
                                vertical: 0.2 * SizeConfig.heightMultiplier),
                            child: Card(
                              elevation: 0.5,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ProductDetails(
                                      product: product,
                                    );
                                  }));
                                },
                                child: Container(
                                  width: 318,
                                  height: 40 * SizeConfig.heightMultiplier,
                                  // width: 20 * SizeConfig.widthMultiplier,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColors.grey.withOpacity(0.1)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            5 * SizeConfig.widthMultiplier),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height:
                                                48 * SizeConfig.widthMultiplier,
                                            //  height: 190,
                                            // width: 325,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        product.thumbnail ??
                                                            ''),
                                                    // AssetImage(
                                                    //     'assets/images/smartphone_ads.png'),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            height:
                                                3 * SizeConfig.heightMultiplier,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                product.title ?? '',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Text(
                                                '\$${product.price ?? ''}',
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
                                                '\$${product.rating ?? ''}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 2 *
                                                      SizeConfig
                                                          .widthMultiplier),
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
                                            product.brand ?? '',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.lightgrey,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                2 * SizeConfig.heightMultiplier,
                                          ),
                                          Text(
                                            product.category ?? '',
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
                        }));
                  }
                }),
          )
        ]),
      ),
    );
  }
}
