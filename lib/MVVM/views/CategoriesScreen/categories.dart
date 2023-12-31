import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/MVVM/viewModels/services/api_services.dart';
import 'package:my_store/MVVM/views/Product_Category_Screen/item_list.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/custom_bottom_navigation.dart';
import 'package:my_store/utils/widgets/customtextfield.dart';

class CategoriesScreen extends StatefulWidget {
  // static const routName = '/categories';

  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  List<String> allCategories = [];
  List<String> displayedCategories = [];
  TextEditingController searchController = TextEditingController();


  @override
  void initState(){
    super.initState();
   // Call your API to get the category list and set it to allCategories
    // You can use your own API service method here
    fetchCategories();

  }

  Future<void> fetchCategories() async{
  try{
  List<String> categories =  await ApiServices.getCategoryApi('');
  setState(() {
    allCategories = categories;
    displayedCategories = List.from(allCategories);
  });
  }
  catch(error){
      print('Error fetching categories: $error');
      // Handle error as needed, e.g., show an error message to the user

  }
  }







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
            CustomTextfield(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  displayedCategories = allCategories.where((category) =>
                   category.toLowerCase().contains(value.toLowerCase())).toList();
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

     Widget buildgridView(double width) {
    int crossAxisCount = calculateCrossAxisCount(width);
    return FutureBuilder<List<String>>(
        future: ApiServices.getCategoryApi(''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return const Center(child: CircularProgressIndicator());
          }
          // If the Future throws an error, show an error message
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categoies are Avalible'));
          } else {
            // If the data is null or empty, display a message or return an empty widget
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      200, // Adjust this value to control item aspect ratio
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 2.0,
                  childAspectRatio:
                      1.0, // Adjust this value to control item aspect ratio
                ),
                itemCount: displayedCategories.length,
               // itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {

                //  final category = snapshot.data![index];

                final category = displayedCategories[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ItemList(
                          categoryName: category,
                        );
                      }));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 25),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 3 * SizeConfig.widthMultiplier,
                          top: 15 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          category,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
        });
  }

  int calculateCrossAxisCount(double width) {
    // Calculate the number of items per row based on screen width
    int crossAxisCount = (width / 200).floor(); // Adjust item width as needed
    return crossAxisCount;
  }





}
