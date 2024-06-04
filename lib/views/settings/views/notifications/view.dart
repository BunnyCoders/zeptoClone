import 'package:flutter/material.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  Widget _buildUI() {
    return Column(
      children: [
        const SizedBox(
          height: DSSizes.md,
        ),
        // _linksSection()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        title: 'Notifications',
        showBack: true,
        // isSmallText: false,
      ),
      child: _buildUI(),
    );
  }
}
