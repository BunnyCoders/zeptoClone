// this sharedDataLayer is used as a mechanism to share data between multiple blocs/cubits, it stores all the shared data between blocs/cubits at the same place
// ignore_for_file: prefer_final_fields



import 'package:zepto_clone/core/locator.dart';

final SharedDataLayer sharedDataLayer = locator<SharedDataLayer>();

class SharedDataLayer {
  // avoid using getter and setter for shared data inside sharedDataLayer
}
