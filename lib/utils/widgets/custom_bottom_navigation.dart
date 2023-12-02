import 'package:flutter/material.dart';
import 'package:my_store/MVVM/viewModels/providers/navigation_provider.dart';
import 'package:my_store/MVVM/views/CategoriesScreen/categories.dart';
import 'package:my_store/MVVM/views/FavoriteScreen/favorite.dart';
import 'package:my_store/MVVM/views/Product_Screen/product_screen.dart';
import 'package:my_store/MVVM/views/ProfileScreen/profile.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  @override
  Widget build(BuildContext context) {
    final navigationController = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navigationController.currentIndex,
      backgroundColor: AppColors.black,
      onTap: (index) {
        navigationController.updateIndex(index);

        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const ProductScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
            break;

          case 1:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const CategoriesScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
            break;

          case 2:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const FavoriteScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
            break;

          case 3:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const ProfileScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Product.png'),
            label: 'Products',
            backgroundColor: AppColors.black),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/categories.png'),
            label: 'categories',
            backgroundColor: AppColors.black),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/favorite.png'),
            label: 'favorite',
            backgroundColor: AppColors.black),
        BottomNavigationBarItem(
            icon: Image.asset('assets/icons/person.png'),
            label: 'Person',
            backgroundColor: AppColors.black),
      ],
    );
  }
}
