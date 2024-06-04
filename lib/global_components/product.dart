import 'package:zepto_clone/core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zepto_clone/core/helpers.dart';

class Product extends StatelessWidget {
  const Product({
    Key? key,
    required this.numberOfPeopleRated,
    required this.onTapProduct,
    this.onTapSimilarTo,
    required this.onTapAddToWishlist,
    required this.productId,
    required this.productImageUrl,
    required this.productBrand,
    required this.productName,
    required this.productRating,
    required this.productOriginalPrice,
    required this.productFinalPrice,
    required this.productDiscountPercentage,
    this.showSimilarTo = false,
  }) : super(key: key);

  final String numberOfPeopleRated;
  final Function onTapProduct;
  final Function? onTapSimilarTo;
  final Function onTapAddToWishlist;
  final String productId;
  final String productImageUrl;
  final String productBrand;
  final String productName;
  final String productRating;
  final String productOriginalPrice;
  final String productFinalPrice;
  final String productDiscountPercentage;
  final bool showSimilarTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapProduct(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: DSSizes.xxl + DSSizes.lg + DSSizes.lg,
            child: Stack(
              children: [
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(DSSizes.sm),
                    child: Image.network(
                      productImageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  bottom: DSSizes.sm,
                  left: DSSizes.sm,
                  child: showSimilarTo
                      ? InkWell(
                          onTap: () => onTapSimilarTo!(),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: DSColors.backgroundGrey,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(DSSizes.sm),
                            child: SvgPicture.asset(
                              'assets/icons/similarTo.svg',
                              colorFilter: const ColorFilter.mode(
                                DSColors.headingDark,
                                BlendMode.srcIn,
                              ),
                              height: DSSizes.md,
                              width: DSSizes.md,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                Positioned(
                  bottom: DSSizes.sm,
                  right: DSSizes.sm,
                  child: InkWell(
                    onTap: () => onTapAddToWishlist(),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: DSColors.backgroundGrey,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(DSSizes.sm),
                      child: SvgPicture.asset(
                        'assets/icons/addToWishlist.svg',
                        colorFilter: const ColorFilter.mode(
                          DSColors.headingDark,
                          BlendMode.srcIn,
                        ),
                        height: DSSizes.md,
                        width: DSSizes.md,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DSSizes.sm),
          Text(
            productBrand,
            style: DSType.subtitle2(
              context: context,
              textColor: DSColors.headingDark,
            ),
          ),
          const SizedBox(height: DSSizes.xs),
          Text(
            productName,
            style: DSType.body2(
              context: context,
              textColor: DSColors.bodyDark,
            ),
          ),
          const SizedBox(height: DSSizes.xs),
          IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DSSizes.xs),
                color: DSColors.success,
              ),
              padding: const EdgeInsets.all(DSSizes.xs),
              child: Row(
                children: [
                  Text(
                    productRating,
                    style: DSType.smallBold(
                      context: context,
                      textColor: DSColors.headingLight,
                    ),
                  ),
                  const SizedBox(width: DSSizes.xs),
                  SvgPicture.asset(
                    'assets/icons/rating.svg',
                    colorFilter: const ColorFilter.mode(
                      DSColors.headingLight,
                      BlendMode.srcIn,
                    ),
                    height: DSSizes.sm + DSSizes.xxs,
                    width: DSSizes.sm + DSSizes.xxs,
                  ),
                  const SizedBox(width: DSSizes.sm),
                  Container(
                    color: DSColors.headingLight,
                    height: DSSizes.md,
                    width: 1,
                  ),
                  const SizedBox(width: DSSizes.sm),
                  Text(
                    numberOfPeopleRated,
                    style: DSType.smallBold(
                      context: context,
                      textColor: DSColors.headingLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: DSSizes.sm),
          Row(
            children: [
              Text(
                "₹ $productFinalPrice",
                style: DSType.subtitle2(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
              ),
              const SizedBox(width: DSSizes.xs),
              Text(
                '₹ $productOriginalPrice',
                style: TextStyle(
                  color: DSColors.bodyDark,
                  decoration: TextDecoration.lineThrough,
                  fontFamily: "Lato",
                  fontSize:
                      const AdaptiveTextSize().getAdaptiveTextSize(context, 12),
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0.25,
                ),
              ),
              const SizedBox(width: DSSizes.xs),
              Text(
                "$productDiscountPercentage% off",
                style: DSType.subtitle2(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
