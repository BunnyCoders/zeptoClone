import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchTextFieldController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchTextFieldController.dispose();

    super.dispose();
  }

  String location = 'Null, Press Button';
  String Address = 'search';
  String _currentAddress = 'Get your Location';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    //${place.locality}, ${place.postalCode}, ${place.country}
    Address = '${place.street}, ${place.subLocality}${place.locality} ';
    setState(() {
      _currentAddress = Address;
    });
  }

  void onTapSearch({String searchQuery = ''}) {
    _searchTextFieldController.text = searchQuery;

    if (_formKey.currentState!.validate()) {
      // Navigator.of(context).pushNamed(RoutePaths.search);
    }
  }

  void onChanged() {}

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Navigator.of(context).pushNamed(RoutePaths.search);
    }
  }

  Widget _searchLocation() {
    return SizedBox(
      // width: 120,
      height: DSSizes.xl,
      child: Padding(
        padding: const EdgeInsets.all(DSSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Container(
                  height: DSSizes.xl,
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                    // color: DSColors.placeHolderLight,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: DSColors.placeHolderDark,
                    ),
                  ),
                  child: TextFormField(
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _searchTextFieldController,
                    cursorColor: DSColors.headingDark,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        bottom: DSSizes.md,
                        left: DSSizes.md,
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            DSSizes.sm,
                          ),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          color: DSColors.borderLight,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            DSSizes.xs,
                          ),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          color: DSColors.borderLight,
                        ),
                      ),
                      errorStyle: DSType.body2(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                      filled: true,
                      fillColor: DSColors.backgroundGrey,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintStyle: DSType.body2(
                        context: context,
                        textColor: DSColors.headingDark,
                      ),
                      isDense: true,
                      labelStyle: DSType.body2(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                      labelText: 'Search a new address',
                      prefixIcon: IconButton(
                        onPressed: () => onTapSearch(),
                        icon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          colorFilter: const ColorFilter.mode(
                            DSColors.headingDark,
                            BlendMode.srcIn,
                          ),
                          height: 16.h,
                          width: 16.h,
                        ),
                      ),
                    ),
                    onChanged: (value) => onChanged,
                    onFieldSubmitted: (value) => onSubmit(),
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                    validator: (String? value) {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _currentLocation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          Position position = await _getGeoLocationPosition();
          location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
          GetAddressFromLatLong(position);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/accurate.svg',
              colorFilter:
                  const ColorFilter.mode(DSColors.secondary, BlendMode.srcIn),
              height: 30.h,
              width: 30.w,
            ),
            const SizedBox(
              width: DSSizes.sm,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Location",
                  style: DSType.subtitle1(
                    context: context,
                    textColor: DSColors.secondary,
                  ),
                ),
                Text(
                  "Using Gps",
                  style: DSType.body2(
                    context: context,
                    textColor: DSColors.secondary,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget headingSection({
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(DSSizes.sm),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: DSType.h6(
            context: context,
            textColor: DSColors.headingDark,
          ),
        ),
      ),
    );
  }

  Widget _savedLocation() {
    return ListView.separated(
      itemCount: savedAddressesData["savedAddresses"].length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/icons/address.svg',
                colorFilter:
                    const ColorFilter.mode(DSColors.bodyDark, BlendMode.srcIn),
                height: 30.h,
                width: 30.w,
              ),
              const SizedBox(
                width: DSSizes.sm,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    savedAddressesData["savedAddresses"][index]["addressType"],
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                  ),
                  Text(
                    savedAddressesData["savedAddresses"][index]
                            ["buildingName"] +
                        ", " +
                        savedAddressesData["savedAddresses"][index]
                            ["locality"] +
                        ", \n" +
                        savedAddressesData["savedAddresses"][index]
                            ["landmark"] +
                        ", \n" +
                        savedAddressesData["savedAddresses"][index]["city"] +
                        ", " +
                        savedAddressesData["savedAddresses"][index]
                            ["district"] +
                        ", " +
                        savedAddressesData["savedAddresses"][index]["state"] +
                        ", " +
                        savedAddressesData["savedAddresses"][index]["country"] +
                        ", " +
                        savedAddressesData["savedAddresses"][index]["pincode"],
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                    // maxLines: 2,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: DSSizes.md),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.md,
        ),
        _searchLocation(),
        const SizedBox(
          height: DSSizes.lg,
        ),
        _currentLocation(),
        const SizedBox(
          height: DSSizes.md,
        ),
        headingSection(
          text: "Saved Location",
        ),
        _savedLocation()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          context: context,
          // rightAction: _appBarAction(),
          title: 'Your Location',
          showBack: true),
      child: _buildUI(),
    );
  }
}
