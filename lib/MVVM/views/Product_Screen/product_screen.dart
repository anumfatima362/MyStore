import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:my_store/MVVM/viewModels/classModels/productModel.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/custom_bottom_navigation.dart';
import 'package:my_store/utils/widgets/customtextfield.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> filteredProducts = [];

  Future<ProductModel> getPostApi() async {
    //ham api sa response ka wait kare ga
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
    // ab response ko ham dynamic variable ka andr store kare ga
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 5 * SizeConfig.heightMultiplier,
            ),
            Center(child: mtext('Products')),
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            CustomTextfield(
              onChanged: (value) {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12 * SizeConfig.widthMultiplier,
                  vertical: 3 * SizeConfig.widthMultiplier),
              child: Align(alignment: Alignment.centerLeft, child: ctext()),
            ),
            Expanded(
              child: FutureBuilder<ProductModel>(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.hasData}');
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.products!.length,
                          itemBuilder: ((context, index) {
                            final product = snapshot.data!.products![index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5 * SizeConfig.widthMultiplier,
                                  vertical: 0.2 * SizeConfig.heightMultiplier),
                              child: Card(
                                elevation: 0.5,
                                child: Container(
                                  height: 40 * SizeConfig.heightMultiplier,
                                  width: 20 * SizeConfig.widthMultiplier,
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
                                            height: 190,
                                            // width: 325,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        product.thumbnail ??
                                                            ''),
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
                                                //product.title ?? '',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Text(
                                                '\$${product.price ?? ''}',
                                                //'\$${product.price ?? ''}',
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
                            );
                          }));
                    }
                  }),
            )
          ]),
        ),
        bottomNavigationBar: const CustomNavigation());
  }
}
