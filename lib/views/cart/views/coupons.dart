import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepto_clone/global_components/input_field.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';
// ignore_for_file: prefer_const_constructors

class CouponsView extends StatefulWidget {
  const CouponsView({super.key});

  @override
  State<CouponsView> createState() => _CouponsViewState();
}

class _CouponsViewState extends State<CouponsView> {
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

  void onTapSearch({String searchQuery = ''}) {
    _searchTextFieldController.text = searchQuery;

    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(RoutePaths.search);
    }
  }

  Widget _applyCouponInputField() {
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
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: DSColors.placeHolderDark)),
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
                      filled: false,
                      fillColor: Colors.white,
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
                      labelText: 'Enter Coupon Code',
                    ),
                    onChanged: (value) {},
                    onFieldSubmitted: (value) {},
                    style: DSType.body2(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                    validator: (String? value) {},
                  ),
                ),
              ),
            ),
            // Expanded(
            //   // flex: 4,
            //   child: Container(
            //     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(DSSizes.sm),
            //         border: Border.all(color: DSColors.placeHolderDark)),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //         labelText: "Enter Coupon Code",
            //       ),
            //       controller: _searchTextFieldController,
            //     ),
            //   ),
            // ),
            SizedBox(
              width: DSSizes.md,
            ),
            Button(onTap: () {}, text: "Apply")
          ],
        ),
      ),
    );
  }

  Widget _couponsList() {
    return ListView.builder(
        padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: couponsData["availableCoupons"].length,
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(DSSizes.sm),
            child: TicketWidget(
              width: 400,
              height: 225,
              isCornerRounded: true,
              // padding: EdgeInsets.all(DSSizes.sm),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                couponsData["availableCoupons"][index]
                                            ["couponImageurl"] !=
                                        null
                                    ? Image.network(
                                        couponsData["availableCoupons"][index]
                                            ["couponImageurl"],
                                        height: DSSizes.md,
                                        width: DSSizes.lg,
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(
                                  width: DSSizes.sm,
                                ),
                                Text(
                                  couponsData["availableCoupons"][index]
                                      ["couponName"],
                                  style: DSType.subtitle1(
                                    context: context,
                                    textColor: DSColors.headingDark,
                                  ),
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Text(
                              "Apply",
                              style: DSType.subtitle1(
                                context: context,
                                textColor: DSColors.secondary,
                              ),
                            )
                          ],
                        ),
                        Text(
                          couponsData["availableCoupons"][index]
                              ["couponDescription"],
                          style: DSType.subtitle1(
                            context: context,
                            textColor: DSColors.headingDark,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: DSSizes.lg + DSSizes.sm + DSSizes.sm,
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: DSColors.placeHolderLight,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    SizedBox(
                      height: DSSizes.md,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          couponsData["availableCoupons"][index]["couponRules"],
                          style: DSType.body2(
                            context: context,
                            textColor: DSColors.error,
                          ),
                        ),
                        SizedBox(
                          height: DSSizes.xs,
                        ),
                        Text(
                          couponsData["availableCoupons"][index]
                              ["couponRestictionsRule"],
                          style: DSType.body2(
                            context: context,
                            textColor: DSColors.placeHolderDark,
                          ),
                        ),
                        SizedBox(
                          height: DSSizes.xs,
                        ),
                        Text(
                          "+More",
                          style: DSType.body1(
                            context: context,
                            textColor: DSColors.headingDark,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: DSSizes.md,
          ),
          _applyCouponInputField(),
          _couponsList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Apply Coupon',
        showBack: true,
      ),
      child: _buildUI(),
    );
  }
}
