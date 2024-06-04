import 'package:flutter/material.dart';
import 'package:zepto_clone/core/design_system.dart';
import 'package:zepto_clone/core/validators.dart';
import 'package:zepto_clone/global_components/button.dart';
import 'package:zepto_clone/global_components/custom_appbar.dart';
import 'package:zepto_clone/global_components/input_field.dart';
import 'package:zepto_clone/global_components/page_scaffold.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameOnCardTextFieldController =
      TextEditingController();
  final TextEditingController _phoneNumberTextFieldController =
      TextEditingController();
  final TextEditingController _emailAddressTextFieldController =
      TextEditingController();

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: DSColors.backgroundLight,
            padding: const EdgeInsets.only(
              bottom: DSSizes.lg,
              left: DSSizes.md,
              right: DSSizes.md,
              top: DSSizes.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  controller: _nameOnCardTextFieldController,
                  inputFormatters: const [],
                  placeholder: 'First Name',
                  validator: (String? value) =>
                      firstNameValidator(value: value!),
                ),
                const SizedBox(height: DSSizes.lg),
                InputField(
                  controller: _emailAddressTextFieldController,
                  inputFormatters: const [],
                  placeholder: 'Email Address',
                  validator: (String? value) => emailValidator(value: value!),
                ),
                const SizedBox(height: DSSizes.lg),
                InputField(
                  controller: _phoneNumberTextFieldController,
                  inputFormatters: const [],
                  placeholder: 'Telephone (+91)',
                  validator: (String? value) =>
                      phoneNumberValidator(value: value!),
                ),
                 const SizedBox(height: DSSizes.xl),
                Button(
                  onTap: () {},
                  text: 'Submit',
                  buttonType: ButtonTypes.filled,
                )
              ],
            ),
          ),
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
        _form(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        title: 'Profile',
        showBack: true,
        // isSmallText: false,
      ),
      child: _buildUI(),
    );
  }
}
