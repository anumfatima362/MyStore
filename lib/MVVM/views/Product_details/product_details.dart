import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/MVVM/viewModels/classModels/category_detail_model.dart';
import 'package:my_store/MVVM/viewModels/providers/favorite_provider.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<Favorite>(context, listen: false);
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
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(widget.product.thumbnail ?? ''),
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
                      GestureDetector(
                          onTap: () {
                            if (favoriteProvider
                                .isProductLiked(widget.product.id!)) {
                              favoriteProvider
                                  .removeFromFavorites(widget.product);
                            } else {
                              favoriteProvider.addToFavorites(widget.product);
                            }
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            favoriteProvider.isProductLiked(widget.product.id!)
                                ? 'assets/icons/like_filled.svg'
                                : 'assets/icons/like.svg',
                          )),
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
                      sText(widget.product.title ?? ''),
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
                      sText('\$${widget.product.price ?? ''}'),
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
                      sText(widget.product.category ?? ""),
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
                      sText(widget.product.brand ?? ''),
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
                  sText(widget.product.description ?? ''),
                  SizedBox(
                    height: 1 * SizeConfig.heightMultiplier,
                  ),
                  bText('Product Gallery :'),
                ],
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.heightMultiplier,
            ),
            Expanded(
              child: MasonryGridView.count(
                  crossAxisCount: 2,
                  itemCount: widget.product.images!.length,
                  itemBuilder: (context, index) {
                    return index.isEven
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  //  color: Colors.blue,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.product.images![index]),
                                      fit: BoxFit.cover)),

                              height: 100.0, // Adjust the
                            ),
                          )
                        : Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                                // color: Colors.green,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.product.images![index]),
                                    fit: BoxFit.cover)),

                            // Adjust the height as needed
                          );
                  }),
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
