import 'package:flutter/services.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/core/validators.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/input_field.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberTextFieldController =
      TextEditingController();

  Widget _logoWithText() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Zepto",
            style: DSType.h2(
              context: context,
              textColor: DSColors.headingLight,
            ),
          ),
          const SizedBox(height: DSSizes.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Groceries",
                style: DSType.h6(
                  context: context,
                  textColor: DSColors.headingLight,
                ),
              ),
              Text(
                "delivered in",
                style: DSType.h6(
                  context: context,
                  textColor: DSColors.headingLight,
                ),
              ),
              Text(
                "10 minutes",
                style: DSType.h6(
                  context: context,
                  textColor: DSColors.headingLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(DSSizes.md),
        child: Column(
          children: [
            InputField(
              prefixText: '+91',
              isKeyboardTypeNumber: true,
              controller: _phoneNumberTextFieldController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              placeholder: ' Enter phone number',
              validator: (String? value) => phoneNumberValidator(value: value!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingActionButton() {
    void onTapLogin() {
      // Navigator.of(context).pushNamed(
      //   RoutePaths.rootTabBar,
      //   arguments: RootTabBarViewArgument(
      //     selectedIndex: 0,
      //   ),
      // );
      Navigator.of(context).pushNamed(
        RoutePaths.otp,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: DSSizes.md,
        right: DSSizes.md,
        top: DSSizes.md,
      ),
      child: Button(
        isRounded: true,
        buttonType: ButtonTypes.filled,
        text: 'Continue',
        onTap: () => onTapLogin(),
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Padding(
          padding: const EdgeInsets.all(DSSizes.md),
          child: _logoWithText(),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        _form(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        _floatingActionButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          DSColors.primary,
          Color(0xff281537),
        ])),
        child: _buildUI(),
      ),
    );
  }
}
