import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/MVVM/views/ProfileScreen/functions.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:my_store/utils/widgets/CustomText.dart';
import 'package:my_store/utils/widgets/custom_bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 1 * SizeConfig.heightMultiplier,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(child: mtext('Anum Nadeem')),
          SizedBox(
            height: 4 * SizeConfig.heightMultiplier,
          ),
          Container(
              height: 95,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: Row(
                children: [
                  SizedBox(
                    width: 4 * SizeConfig.widthMultiplier,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 34,
                  ),
                  SizedBox(
                    width: 4 * SizeConfig.widthMultiplier,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anum Nadeem',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'myname@gmail.com',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        '07XXXXXXXX',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          FunctionWidget(
            text: 'Kontoinstallningar',
            svgPath: 'assets/icons/settings.svg',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          FunctionWidget(
            text: 'Mina betalmetoder',
            svgPath: 'assets/icons/playlist.svg',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          FunctionWidget(
            text: 'Support',
            svgPath: 'assets/icons/support.svg',
          ),
        ]),
      )),
      bottomNavigationBar: const CustomNavigation(),
    );
  }
}
