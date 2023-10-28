import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:ti_bank/custom_theme.dart';
import 'package:ti_bank/routes.dart';
import 'package:ti_bank/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Settings',
                style: context.textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 32),
            SettingsButton(
              iconPath: 'assets/privacy_policy.svg',
              title: 'Privacy Policy',
              onTap: () => _onPrivacyPolicyTap(context),
            ),
            SettingsButton(
              iconPath: 'assets/terms_of_use.svg',
              title: 'Terms of use',
              onTap: () => _onTermsOfUseTap(context),
            ),
            SettingsButton(
              iconPath: 'assets/privacy_policy.svg',
              title: 'Support',
              onTap: () => _onSupportTap(context),
            ),
            SettingsButton(
              iconPath: 'assets/rate_app.svg',
              title: 'Rate app in AppStore',
              onTap: () => InAppReview.instance
                  .openStoreListing(appStoreId: '6470714628'),
            ),
          ],
        ),
      ),
    );
  }

  void _onTermsOfUseTap(BuildContext context) {
    context.pushNamed(Routes.ll,
        extra:
            'https://docs.google.com/document/d/16e3jTHiwHcrFmYMfpGBeq8hL4xTMscM1sTd9ZOhXIbc/edit?usp=sharing');
  }

  void _onPrivacyPolicyTap(BuildContext context) {
    context.pushNamed(Routes.ll,
        extra:
            'https://docs.google.com/document/d/18jCpcvy79ypdQam8dvpuE8TPBqlufitPrxqZq16IzqA/edit?usp=sharing');
  }

  void _onSupportTap(BuildContext context) {
    context.pushNamed(Routes.ll, extra: 'https://forms.gle/9WYx5NN8nvBnH6cp6');
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: CustomTheme.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
