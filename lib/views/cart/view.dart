import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  Widget _appBarAction() {
    void onTapAddMore() {}

    return Row(
      children: [
        Button(
          onTap: () {},
          text: "Add More",
          buttonType: ButtonTypes.filled,
          // isSmall: true,
        )
      ],
    );
  }

  Widget _floatingActionButton() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.10,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            DSSizes.xs,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
            )
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DSSizes.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: DSType.smallBold(
                      context: context, textColor: DSColors.headingDark),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/address.svg",
                      colorFilter: const ColorFilter.mode(
                          DSColors.secondary, BlendMode.srcIn),
                      height: DSSizes.sm,
                      width: DSSizes.sm,
                    ),
                    const SizedBox(
                      width: DSSizes.xs,
                    ),
                    Text(
                      "Change",
                      style: DSType.smallBold(
                          context: context, textColor: DSColors.secondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: DSSizes.md,
              right: DSSizes.md,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "To Pay",
                      style: DSType.subtitle1(
                        context: context,
                        textColor: DSColors.headingDark,
                      ),
                    ),
                    Text(
                      "96.49",
                      style: DSType.h6(
                        context: context,
                        textColor: DSColors.headingDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: DSSizes.md,
                ),
                Expanded(
                  child: Button(
                    onTap: () => _onTapContinueToPayment(),
                    text: "Continue To Payment",
                    buttonType: ButtonTypes.filled,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onTapContinueToPayment() {
    Navigator.of(context).pushNamed(
      RoutePaths.upiPayment,
    );
  }

  Widget _couponCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            DSSizes.md,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              // spreadRadius: 1,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(DSSizes.md),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/offer.png",
                height: DSSizes.lg,
                width: DSSizes.lg,
                color: DSColors.success,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Save ₹11 more on this order",
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                  ),
                  Text(
                    "Code FREE75",
                    style: DSType.body1(
                      context: context,
                      textColor: DSColors.placeHolderDark,
                    ),
                  ),
                ],
              ),
              Button(onTap: () {}, text: 'Apply')
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutePaths.coupon,
              );
            },
            child: const Center(
              child: Text("View All Coupons"),
            ),
          )
        ]),
      ),
    );
  }

  Widget _cartProduct() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            DSSizes.xs,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              // spreadRadius: 1,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(DSSizes.md),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https://cdn.zeptonow.com/production///tr:w-100,ar-1021-1021,pr-true,f-auto,q-80/cms/product_variant/5f134c5a-96e7-4a31-95be-aa3958d768c1.jpeg",
                height: DSSizes.xl,
                width: DSSizes.xl,
                // color: DSColors.success,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: DSSizes.xxl,
                    child: Text(
                      "Lay's India's Magic Masala Potato Chips",
                      style: DSType.subtitle1(
                        context: context,
                        textColor: DSColors.headingDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: DSSizes.xxl,
                    child: Text(
                      "50 g",
                      style: DSType.body1(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Button(onTap: () {}, text: 'Apply'),
              SizedBox(
                width: DSSizes.lg,
              ),
              Text(
                "₹20",
                style: DSType.subtitle1(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _deleiveryPartenerTip() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              DSSizes.xs,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(DSSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery Partner Tip",
                style: DSType.subtitle1(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
              ),
              // SizedBox(height: DSSizes.sm,),786
              Text(
                "The entire amount will be sent to your delivery partner",
                style: DSType.body1(
                  context: context,
                  textColor: DSColors.placeHolderDark,
                ),
              ),
            ],
          ),
        ));
  }

  Widget _ordertotal() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              DSSizes.xs,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(DSSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Item Total",
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹30",
                        style: DSType.subtitle1(
                          context: context,
                          textColor: DSColors.placeHolderLight,
                          isLineThrough: true,
                        ),
                      ),
                      const SizedBox(
                        width: DSSizes.xs,
                      ),
                      Text(
                        "₹20",
                        style: DSType.subtitle1(
                          context: context,
                          textColor: DSColors.headingDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              orderFairText(
                heading: "Small Cart Fee",
                originalPrice: "",
                discountPrice: "₹35",
              ),
              orderFairText(
                heading: "Handling Charges",
                originalPrice: "₹35",
                discountPrice: "₹5",
              ),
              orderFairText(
                heading: "Delivery Fee",
                originalPrice: "",
                discountPrice: "₹25",
              ),
              Text(
                'Add products worth 41 to save 25 on delivery ',
                style: DSType.subtitle1(
                  context: context,
                  textColor: DSColors.success,
                ),
              ),
              SizedBox(
                height: DSSizes.sm,
              ),
              Divider(),
              SizedBox(
                height: DSSizes.sm,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "To Pay",
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                  ),
                  Text(
                    "₹85",
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: DSSizes.md,
              ),
            ],
          ),
        ));
  }

  Row orderFairText({
    required String heading,
    required String originalPrice,
    required String discountPrice,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: DSType.subtitle1(
            context: context,
            textColor: DSColors.placeHolderLight,
          ),
        ),
        Row(
          children: [
            Text(
              originalPrice,
              style: DSType.subtitle1(
                context: context,
                textColor: DSColors.placeHolderLight,
                isLineThrough: true,
              ),
            ),
            const SizedBox(
              width: DSSizes.xs,
            ),
            Text(
              discountPrice,
              style: DSType.subtitle1(
                context: context,
                textColor: DSColors.success,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _deliveryInstruction() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              DSSizes.xs,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(DSSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery Instructions",
                style: DSType.subtitle1(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
              ),
              // SizedBox(height: DSSizes.sm,),786
              Text(
                "Delivery partner will be notified",
                style: DSType.body1(
                  context: context,
                  textColor: DSColors.placeHolderDark,
                ),
              ),
              SizedBox(
                height: DSSizes.xl + DSSizes.lg + DSSizes.sm,
                width: double.infinity,
                child: ListView.builder(
                    padding: const EdgeInsets.all(DSSizes.sm),
                    scrollDirection: Axis.horizontal,
                    itemCount: cartData["deliveryInstructionsData"].length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(DSSizes.sm),
                        child: Container(
                          height: DSSizes.xxl + DSSizes.md,
                          width: DSSizes.xxl + DSSizes.xl,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                DSSizes.xs,
                              ),
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 1)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: NetworkImage(
                                  cartData["deliveryInstructionsData"][index]
                                      ["imageUrl"],
                                ),
                                height: DSSizes.lg,
                                width: DSSizes.lg,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartData["deliveryInstructionsData"][index]
                                        ["headingText"],
                                    style: DSType.subtitle1(
                                        context: context,
                                        textColor: DSColors.headingDark),
                                  ),
                                  Text(
                                    cartData["deliveryInstructionsData"][index]
                                        ["contentText"],
                                    style: DSType.small(
                                        context: context,
                                        textColor: DSColors.headingDark),
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  void onTapLearnMore() {
    void onTapCross() {
      Navigator.of(context).pop();
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return IntrinsicHeight(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: DSColors.borderLight,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(DSSizes.lg),
                    topRight: Radius.circular(DSSizes.lg),
                  ),
                  color: DSColors.backgroundLight,
                ),
                padding: const EdgeInsets.only(
                  bottom: DSSizes.lg,
                  left: DSSizes.md,
                  right: DSSizes.md,
                  top: DSSizes.md,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: NetworkImage(
                            "https://cdn.zeptonow.com/app/images/zeptonian-riding.png?tr=w-1080,q-70"),
                        height: DSSizes.xxl,
                        width: DSSizes.xxl,
                      ),
                    ),
                    const SizedBox(height: DSSizes.sm),
                    Center(
                      child: Text(
                        "Here's How We Do It",
                        style: DSType.h6(
                          context: context,
                          textColor: DSColors.headingDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: DSSizes.sm),
                    learnMoreContent(
                      context: context,
                      imagePath:
                          "https://cdn.zeptonow.com/app/images/lucide_timer.png?tr=w-1080,q-70",
                      contentText:
                          "Delivery partners ride safely at \n an average speed of 15kmph per delivery",
                    ),
                    const SizedBox(height: DSSizes.sm),
                    learnMoreContent(
                      context: context,
                      imagePath:
                          "https://cdn.zeptonow.com/app/images/lucide_bike.png?tr=w-1080,q-70",
                      contentText:
                          "No penalties for late deliveries \n & no incentives for on-time deliveries",
                    ),
                    const SizedBox(height: DSSizes.sm),
                    learnMoreContent(
                      context: context,
                      imagePath:
                          "https://cdn.zeptonow.com/app/images/lucide_megaphone.png?tr=w-1080,q-70",
                      contentText:
                          "Delivery partners are not informed \n about promised delivery time",
                    ),
                    const SizedBox(height: DSSizes.sm),
                    Button(
                      onTap: () => onTapCross(),
                      text: "Close",
                      buttonType: ButtonTypes.filled,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Card learnMoreContent({
    required BuildContext context,
    required String imagePath,
    required String contentText,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: DSSizes.xl,
        width: double.infinity,
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                imagePath,
              ),
              height: DSSizes.lg,
              width: DSSizes.lg,
            ),
            const SizedBox(height: DSSizes.sm),
            Text(
              contentText,
              style: DSType.body2(
                context: context,
                textColor: DSColors.headingDark,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _deliveryLearnMoreSection() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            DSSizes.xs,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: NetworkImage(
                "https://cdn.zeptonow.com/app/images/zeptonian-riding.png?tr=w-1080,q-70"),
            height: DSSizes.xl,
            width: DSSizes.xl,
          ),
          Text(
            "See how we ensure our delivery \n partner’s safety",
            style: DSType.smallBold(
              context: context,
              textColor: DSColors.headingDark,
            ),
          ),
          InkWell(
            onTap: () => onTapLearnMore(),
            child: Text(
              "Learn More",
              style: DSType.subtitle1(
                context: context,
                textColor: DSColors.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.md,
        ),
        _couponCard(),
        const SizedBox(
          height: DSSizes.sm,
        ),
        _cartProduct(),
        const SizedBox(
          height: DSSizes.sm,
        ),
        _deleiveryPartenerTip(),
        const SizedBox(
          height: DSSizes.sm,
        ),
        _ordertotal(),
        const SizedBox(
          height: DSSizes.sm,
        ),
        _deliveryInstruction(),
        const SizedBox(
          height: DSSizes.sm,
        ),
        _deliveryLearnMoreSection(),
        const SizedBox(
          height: DSSizes.xxl,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        rightAction: _appBarAction(),
        title: 'Cart',
        // showBack: true
      ),
      child: _buildUI(),
      floatingActionButton: _floatingActionButton(),
    );
  }
}
