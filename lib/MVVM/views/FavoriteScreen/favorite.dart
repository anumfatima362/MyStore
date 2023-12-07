import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/MVVM/viewModels/classModels/category_detail_model.dart';
import 'package:my_store/MVVM/viewModels/providers/favorite_provider.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/custom_bottom_navigation.dart';
import 'package:my_store/utils/widgets/customtextfield.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();

  }

  Future<void> searchProducts(String query) async {
   final favoriteProvider = Provider.of<Favorite>(context ,listen: false);
   setState(() {
    favoriteProvider.filterLikedProducts(query);
   });

  }






  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<Favorite>(context);
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
            CustomTextfield(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchProducts(value);
                });
              },
            ),
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
              child: ListView.builder(
                 itemCount: favoriteProvider.filteredLikedProducts.length ,
                 // itemCount: favoriteProvider.likedProductIds.length,
                  itemBuilder: (context, index) {
                    Product product = favoriteProvider.filteredLikedProducts[index];
                    //Product product = favoriteProvider.likedProductIds[index];
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            product.thumbnail ?? ''),
                                        radius: 35,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$${product.rating ?? ''}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 2 *
                                                      SizeConfig
                                                          .widthMultiplier),
                                              RatingBar.builder(
                                                  initialRating: product
                                                          .rating ??
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
                                  GestureDetector(
                                    onTap: () {
                                      favoriteProvider
                                          .removeFromFavorites(product);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    ),
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
