import 'package:get_it/get_it.dart';

import '../services/api_service.dart';
import 'shared_data_layer.dart';

// this file uses get_it package, this package enables us to implement design patterns like singleton, factory, etc easily
GetIt locator = GetIt.instance;

void setupLocator() {
  // this will create single object for SharedDataLayer throughout the app
  locator.registerLazySingleton(() => SharedDataLayer());

  locator.registerLazySingleton(() => ApiService());
}
