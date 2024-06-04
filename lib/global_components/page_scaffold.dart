import 'package:zepto_clone/core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zepto_clone/global_blocs/internet_connectivity_bloc.dart';

// ignore: must_be_immutable
class PageScaffold extends StatelessWidget {
  final PreferredSize? appBar;
  Color? backgroundColor;
  final Widget? bottomSheet;
  final Widget child;
  final Widget? floatingActionButton;
  final GlobalKey? scaffoldKey;

  PageScaffold({
    super.key,
    this.appBar,
    this.backgroundColor = DSColors.backgroundGrey,
    this.bottomSheet,
    required this.child,
    this.floatingActionButton,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        backgroundColor: backgroundColor,
        bottomSheet: bottomSheet,
        floatingActionButton: floatingActionButton != null
            ? Visibility(
                visible: !isKeyboardOpen,
                child: floatingActionButton!,
              )
            : const SizedBox.shrink(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child:
              BlocListener<InternetConnectivityBloc, InternetConnectivityState>(
            listener: (context, state) {
              if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(days: 1),
                    content: Text(
                      "Connection lost",
                      style: DSType.subtitle2(context: context),
                    ),
                    backgroundColor: DSColors.error,
                  ),
                );
              } else if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              }
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
