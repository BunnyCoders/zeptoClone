import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  Widget topOrderCard() {
    return Container(
      height: 200,
      width: 400,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: DSSizes.md,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ORDER ID: DFF26DRRS26288",
                      style: DSType.h6(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                    ),
                    Text(
                      "Placed on 12/02/2024 at 11:36pm",
                      style: DSType.subtitle1(
                        context: context,
                        textColor: DSColors.placeHolderDark,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                        DSSizes.xs,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "Returned",
                      style: DSType.subtitle1(
                        context: context,
                        textColor: DSColors.bodyLight,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: DSSizes.md,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(DSSizes.md),
              child: Row(
                children: [
                  Expanded(
                    child: Button(
                      onTap: () {},
                      text: 'Reorder',
                    ),
                  ),
                  const SizedBox(
                    width: DSSizes.md,
                  ),
                  Expanded(
                    child: Button(
                      onTap: () {},
                      text: 'Rate Order',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderStatus() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          DSSizes.xs,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            DSColors.primary,
            DSColors.primaryG2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DSSizes.md),
        child: Column(
          children: [
            const SizedBox(
              height: DSSizes.sm,
            ),
            Text(
              "Order Cancelled",
              style: DSType.h6(
                context: context,
                textColor: DSColors.headingLight,
              ),
            ),
            const SizedBox(
              height: DSSizes.md,
            ),
            Center(
              child: Text(
                "Your payment was not completed. Any amount if debited will get refunded within 3-5 days. Please try placing the order again.",
                style: DSType.subtitle1(
                  context: context,
                  textColor: DSColors.headingLight,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderDetails() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: ordersData["orders"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image:
                        NetworkImage(ordersData["orders"][index]["imageUrl"]),
                    height: DSSizes.xl,
                    width: DSSizes.xl,
                  ),
                  SizedBox(
                    width: DSSizes.xxxl,
                    child: Text(
                      ordersData["orders"][index]["productName"].toString(),
                      style: DSType.subtitle1(
                        context: context,
                        textColor: DSColors.headingDark,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    ordersData["orders"][index]["orderAmount"],
                    style: DSType.subtitle1(
                      context: context,
                      textColor: DSColors.headingDark,
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          );
        });
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

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.sm,
        ),
        topOrderCard(),
        _orderStatus(),
        Divider(),
        _orderDetails(),
        orderFairText(
          heading: "Handling Charges",
          originalPrice: "₹35",
          discountPrice: "₹5",
        ),
        orderFairText(
          heading: "Delivery Fees",
          originalPrice: "₹25",
          discountPrice: "₹0",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Order',
        showBack: true,
      ),
      child: _buildUI(),
    );
  }
}
