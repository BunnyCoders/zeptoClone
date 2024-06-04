import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/data.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class CustomerSupportView extends StatefulWidget {
  const CustomerSupportView({super.key});

  @override
  State<CustomerSupportView> createState() => _CustomerSupportViewState();
}

class _CustomerSupportViewState extends State<CustomerSupportView> {
  Widget _linksSection() {
    Widget link({
      required String routePath,
      required String text,
    }) {
      return InkWell(
        // onTap: () => Navigator.of(context).pushNamed(routePath),
        child: Container(
          padding: const EdgeInsets.all(DSSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: DSType.subtitle1(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/forwardArrow.svg",
                colorFilter:
                    const ColorFilter.mode(DSColors.secondary, BlendMode.srcIn),
                height: DSSizes.sm + DSSizes.xs,
                width: DSSizes.sm + DSSizes.xs,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        link(
          routePath: RoutePaths.orders,
          text: 'Coupons & Offers',
        ),
        const Divider(),
        link(
          routePath: RoutePaths.customerCare,
          text: 'General Inquiry',
        ),
        const Divider(),
        link(
          routePath: '',
          text: 'Payment Related',
        ),
        const Divider(),
        link(
          routePath: '',
          text: 'Feedback & Suggestions',
        ),
        const Divider(),
        link(
          routePath: '',
          text: 'Order / Products Related',
        ),
        const Divider(),
        link(
          routePath: '',
          text: 'Zepto Pass',
        ),
      ],
    );
  }

  Widget recentOrders() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
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
      padding: const EdgeInsets.all(DSSizes.sm),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Orders",
                style: DSType.h6(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See All",
                      style: DSType.subtitle1(
                        context: context,
                        textColor: DSColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: DSSizes.xs,
                  ),
                  SvgPicture.asset(
                    'assets/icons/forwardArrow.svg',
                    colorFilter: const ColorFilter.mode(
                        DSColors.secondary, BlendMode.srcIn),
                    height: DSSizes.sm + DSSizes.xs,
                    width: DSSizes.sm + DSSizes.xs,
                  ),
                ],
              ),
            ],
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(DSSizes.sm),
              itemCount: ordersData["orders"].length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
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
                    Divider(),
                  ],
                );
              })
        ],
      ),
    );
  }

  Widget customerSupportAndFaqs() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
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
      padding: const EdgeInsets.all(DSSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FAQs",
            style: DSType.h6(
              context: context,
              textColor: DSColors.headingDark,
            ),
          ),
          const SizedBox(
            height: DSSizes.sm,
          ),
          _linksSection(),
        ],
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.sm,
        ),
        recentOrders(),
        const SizedBox(
          height: DSSizes.sm,
        ),
        customerSupportAndFaqs(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Customer Support & FAQs',
        showBack: true,
        isSmallText: false,
      ),
      child: _buildUI(),
    );
  }
}
