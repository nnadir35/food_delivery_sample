import 'package:get_it/get_it.dart';

import '../route/route.gr.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AppRouter>(AppRouter());
}
