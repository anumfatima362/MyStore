import 'package:flutter/material.dart';
import 'package:my_store/helper/Routes_helper/route_helper.dart';
import 'package:my_store/helper/provider_helper/route_provider.dart';
import 'package:my_store/utils/constants/size_configration.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MultiProvider(
            providers: Providerhelper.Provider,
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              routes: RouterHelper.routes,
            ),
          );
        });
      },
    );
  }
}
