import 'package:flutter/material.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class RefundView extends StatefulWidget {
  const RefundView({super.key});

  @override
  State<RefundView> createState() => _RefundViewState();
}

class _RefundViewState extends State<RefundView> {
  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.md,
        ),
        Center(
          child: Column(
            children: [
              Text(
                "No Refunds",
                style: DSType.subtitle1(
                    context: context, textColor: DSColors.headingDark),
              ),
              Text(
                "You have no active or past refunds",
                style: DSType.subtitle1(
                    context: context, textColor: DSColors.placeHolderDark),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        title: 'Refunds',
        showBack: true,
        // isSmallText: false,
      ),
      child: _buildUI(),
    );
  }
}
