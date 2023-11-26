import 'package:blocwithgetit/Util/Constant/app_info.dart';
import 'package:blocwithgetit/module/howto.dart/how_to_install.dart';
import 'package:blocwithgetit/module/privacy/privacy.dart';
import 'package:blocwithgetit/module/terms/terms.dart';
import 'package:blocwithgetit/state_util.dart';
import 'package:blocwithgetit/widget/setting_group.dart';
import 'package:blocwithgetit/widget/setting_option.dart';
import 'package:blocwithgetit/widget/title_custom.dart';
import 'package:blocwithgetit/widget/version.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

class AboutInfo extends StatelessWidget {
  AboutInfo({super.key});
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'About App',
          style: GoogleFonts.cousine(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SettingsGroup(
            title: 'How to',
            options: [
              SettingsOption(
                icon: Icons.install_mobile_rounded,
                title: 'How to install',
                subtitle: 'How to install melmod to phone',
                onTap: () => Get.to(HowToInstall()),
              ),
            ],
          ),
          SettingsGroup(
            title: 'About Notice',
            options: [
              SettingsOption(
                icon: Icons.security,
                title: 'Privacy Policy',
                subtitle: 'Click for read for more',
                onTap: () => Get.to(PrivacyPolicy()),
              ),
              Divider(
                color: Colors.green.withOpacity(0.4),
                endIndent: 10,
                indent: 10,
              ),
              SettingsOption(
                icon: Icons.handshake,
                title: 'Terms of Use',
                subtitle: 'Click for read for more',
                onTap: () => Get.to(TermsOfUse()),
              ),
            ],
          ),
          SettingsGroup(
            title: 'Support Developer',
            options: [
              SettingsOption(
                icon: FluentIcons.star_24_regular,
                title: 'Rate this app',
                subtitle: 'If you love this app rate it',
                onTap: ()  => inAppReview.openStoreListing(appStoreId: packageName),
              ),
              Divider(
                color: Colors.green.withOpacity(0.4),
                endIndent: 10,
                indent: 10,
              ),
              SettingsOption(
                icon: FluentIcons.share_24_regular,
                title: 'Share',
                subtitle: 'Share this app to your friends',
                onTap: () => Share.share(
                  '$appName • Download now on play store free without ads $urlPS$packageName',
                  subject: appName,
                ),
              ),
            ],
          ),
          SettingsGroup(
            title: 'About version',
            options: [
              AboutVersion(),
              Divider(
                color: Colors.green.withOpacity(0.4),
                endIndent: 10,
                indent: 10,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomTitle(appName),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
