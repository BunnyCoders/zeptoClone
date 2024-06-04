import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_pinput/new_pinput.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/core/router.dart';
import 'package:zepto_clone/global_components/button.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _formKey = GlobalKey<FormState>();

  late List<TextEditingController> _otpTextFieldControllers;

  final _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _viewModel.init(context: context);
    // });

    _otpTextFieldControllers =
        List.generate(6, (index) => TextEditingController());

    for (TextEditingController otpTextFieldController
        in _otpTextFieldControllers) {
      otpTextFieldController.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    for (TextEditingController otpTextFieldController
        in _otpTextFieldControllers) {
      otpTextFieldController.dispose();
      otpTextFieldController.removeListener(_onFocusChange);
    }

    super.dispose();
  }

  void _onFocusChange() {}

  Widget _otpInputField({
    bool autoFocus = false,
    required TextEditingController controller,
    bool enabled = true,
    required FocusNode focusNode,
    bool isLabelCenter = false,
    bool isBold = false,
    required List<TextInputFormatter> inputFormatters,
    bool isPassword = false,
    bool isKeyboardTypeNumber = false,
    bool isTextCenter = false,
    String? Function(String)? onChanged,
    String? Function(String)? onSubmitted,
    String label = '',
    String placeholder = '',
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          autofocus: autoFocus,
          controller: controller,
          cursorColor: DSColors.headingDark,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(DSSizes.md),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
              borderSide: BorderSide(
                width: 1,
                color: DSColors.borderLight,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  DSSizes.xxxl,
                ),
              ),
              borderSide: BorderSide(
                width: 1,
                color: DSColors.error,
              ),
            ),
            filled: true,
            fillColor: DSColors.headingLight,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  DSSizes.xxxl,
                ),
              ),
              borderSide: BorderSide(
                color: DSColors.bodyLight,
                width: 1,
              ),
            ),
            isCollapsed: true,
            hintText: placeholder,
            hintStyle: DSType.body2(
              context: context,
              textColor: DSColors.placeHolderDark,
            ),
          ),
          enabled: enabled,
          focusNode: focusNode,
          keyboardType:
              isKeyboardTypeNumber ? TextInputType.number : TextInputType.text,
          obscureText: isPassword,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          style: isBold
              ? DSType.h6(
                  context: context,
                  textColor: DSColors.headingDark,
                )
              : DSType.body2(
                  context: context,
                  textColor: DSColors.headingDark,
                ),
          textAlign: isTextCenter ? TextAlign.center : TextAlign.left,
          validator: validator,
        ),
      ],
    );
  }

  void onTapVerify() {
    Navigator.of(context).pushNamed(
      RoutePaths.rootTabBar,
      arguments: RootTabBarViewArgument(
        selectedIndex: 0,
      ),
    );
  }

  Widget _mainSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: _otpInputField(
                      autoFocus: true,
                      controller: _otpTextFieldControllers[0],
                      focusNode: _focusNodes[0],
                      isBold: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      isKeyboardTypeNumber: true,
                      isTextCenter: true,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        }

                        return;
                      },
                      placeholder: '',
                      validator: (String? value) {},
                    ),
                  ),
                  Expanded(
                    child: _otpInputField(
                      controller: _otpTextFieldControllers[1],
                      focusNode: _focusNodes[1],
                      isBold: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      isKeyboardTypeNumber: true,
                      isTextCenter: true,
                      onChanged: (value) {
                        if (1 < _otpTextFieldControllers.length) {
                          if (value.isEmpty) {
                            _focusNodes[1 - 1].requestFocus();
                          } else {
                            _focusNodes[1 + 1].requestFocus();
                          }
                        }

                        return;
                      },
                      placeholder: '',
                      validator: (String? value) {},
                    ),
                  ),
                  Expanded(
                    child: _otpInputField(
                        controller: _otpTextFieldControllers[2],
                        focusNode: _focusNodes[2],
                        isBold: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        isKeyboardTypeNumber: true,
                        isTextCenter: true,
                        onChanged: (value) {
                          if (2 < _otpTextFieldControllers.length) {
                            if (value.isEmpty) {
                              _focusNodes[2 - 1].requestFocus();
                            } else {
                              _focusNodes[2 + 1].requestFocus();
                            }
                          }

                          return;
                        },
                        placeholder: '',
                        validator: (String? value) {}),
                  ),
                  Expanded(
                    child: _otpInputField(
                        controller: _otpTextFieldControllers[3],
                        focusNode: _focusNodes[3],
                        isBold: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        isKeyboardTypeNumber: true,
                        isTextCenter: true,
                        onChanged: (value) {
                          if (3 < _otpTextFieldControllers.length) {
                            if (value.isEmpty) {
                              _focusNodes[3 - 1].requestFocus();
                            } else {
                              _focusNodes[3 + 1].requestFocus();
                            }
                          }

                          return;
                        },
                        placeholder: '',
                        validator: (String? value) {}),
                  ),
                  Expanded(
                    child: _otpInputField(
                      controller: _otpTextFieldControllers[4],
                      focusNode: _focusNodes[4],
                      isBold: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      isKeyboardTypeNumber: true,
                      isTextCenter: true,
                      onChanged: (value) {
                        if (4 < _otpTextFieldControllers.length) {
                          if (value.isEmpty) {
                            _focusNodes[4 - 1].requestFocus();
                          } else {
                            _focusNodes[4 + 1].requestFocus();
                          }
                        }

                        return;
                      },
                      placeholder: '',
                      validator: (String? value) {},
                    ),
                  ),
                  Expanded(
                    child: _otpInputField(
                      controller: _otpTextFieldControllers[5],
                      focusNode: _focusNodes[5],
                      isBold: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      isKeyboardTypeNumber: true,
                      isTextCenter: true,
                      onChanged: (value) {
                        if (5 < _otpTextFieldControllers.length) {
                          if (value.isEmpty) {
                            _focusNodes[5 - 1].requestFocus();
                          }
                        }

                        return;
                      },
                      placeholder: '',
                      validator: (String? value) {},
                      onSubmitted: (String? value) {
                        return;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: DSSizes.lg,
              ),
              Padding(
                padding: const EdgeInsets.all(DSSizes.md),
                child: Button(
                  onTap: () => onTapVerify(),
                  text: 'Verify',
                  buttonType: ButtonTypes.filled,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget topSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DSSizes.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OTP",
            style: DSType.h6(
              context: context,
              textColor: DSColors.headingLight,
            ),
          ),
          Text(
            "Verification",
            style: DSType.h6(
              context: context,
              textColor: DSColors.headingLight,
            ),
          ),
          Text(
            "OTP has been sent to ",
            style: DSType.subtitle1(
              context: context,
              textColor: DSColors.headingLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: DSSizes.xl,
        ),
        topSection(),
        SizedBox(
          height: DSSizes.xl,
        ),
        _mainSection(),
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
