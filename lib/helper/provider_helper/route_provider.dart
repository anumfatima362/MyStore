import 'package:my_store/MVVM/viewModels/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class Providerhelper {
  static List<ChangeNotifierProvider> Provider = [
    ChangeNotifierProvider<NavigationProvider>(
        create: (context) => NavigationProvider()),
  ];
}
