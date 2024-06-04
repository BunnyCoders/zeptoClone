import 'package:flutter/material.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  // ordersData["orders"]
  Widget _ordersList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(DSSizes.sm),
        itemCount: ordersData["orders"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(DSSizes.sm),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                RoutePaths.orderDetail,
              ),
              child: Container(
                height: 205,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    DSSizes.xs,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                    ),
                  ],
                  
                ),
                padding: const EdgeInsets.all(DSSizes.sm),
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
                        SizedBox(
                          width: DSSizes.xxxl,
                          child: Text(
                            ordersData["orders"][index]["productName"]
                                .toString(),
                            // homeData["exploreNewCategoriesData"][index]['imageUrl'],
                            style: DSType.subtitle1(
                              context: context,
                              textColor: DSColors.headingDark,
                            ),
                            maxLines: 2,
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
                    const SizedBox(
                      height: DSSizes.sm,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: DSSizes.sm,
                            ),
                            Text(
                              ordersData["orders"][index]["orderId"],
                              style: DSType.body1(
                                context: context,
                                textColor: DSColors.placeHolderDark,
                              ),
                            ),
                            Text(
                              ordersData["orders"][index]["orderDateTime"],
                              style: DSType.body1(
                                context: context,
                                textColor: DSColors.placeHolderDark,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: DSSizes.md + DSSizes.sm,
                          width: DSSizes.xl + DSSizes.sm,
                          decoration: BoxDecoration(
                              color: DSColors.placeHolderLight,
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
                              ordersData["orders"][index]["orderStatus"],
                              style: DSType.body2(
                                context: context,
                                textColor: DSColors.headingDark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: DSSizes.sm,
                    ),
                    SizedBox(
                      height: DSSizes.lg + DSSizes.md,
                      width: DSSizes.xxl + DSSizes.lg,
                      child: Button(
                        onTap: () {},
                        text: 'Reorder',
                      ),
                    ),
                    const SizedBox(
                      height: DSSizes.md,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget orderStatus() {
    return Container();
  }

  Widget _buildUI() {
    return Column(
      children: [
        _ordersList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        title: 'Orders',
        showBack: true,
      ),
      child: _buildUI(),
    );
  }
}
