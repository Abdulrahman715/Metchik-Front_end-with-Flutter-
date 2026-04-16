import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_option.dart';
import 'package:metchik/widgets/custom_setting_option.dart';
import 'package:metchik/widgets/custom_setting_options_group.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Preferences',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 10),

          CustomSettingOptionsGroup(
            options: [
              CustomSwitchSettingOption(
                onTap: () {},
                icon: Icons.dark_mode_outlined,
                title: 'Dark mode',
                isDark: true,
              ),
              CustomSwitchSettingOption(
                onTap: () {},
                icon: Icons.notifications_none,
                title: 'Notifications',
              ),
              CustomSwitchSettingOption(
                onTap: () {},
                icon: Icons.fingerprint,
                title: 'Biometric Unlock',
              ),
              CustomSwitchSettingOption(
                onTap: () {},
                icon: Icons.cloud_queue,
                title: 'Cloud Sync',
              ),
            ],
          ),

          const SizedBox(height: 25),

          // مجموعة General
          const Text(
            "General",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),

          CustomSettingOptionsGroup(
            options: [
              CustomOption(
                icon: Icons.language,
                title: 'language',
                trailingText: 'English',
              ),
              CustomOption(
                icon: Icons.location_on_outlined,
                title: 'Region',
                trailingText: 'Us',
              ),
              CustomOption(
                icon: Icons.storage_outlined,
                title: 'Storage',
                trailingText: '2.4 GB',
              ),
              CustomOption(
                icon: Icons.info_outline,
                title: 'About',
                trailingText: 'v1.0.0',
              ),
            ],
          ),
        
          const SizedBox(height: 25),

           // مجموعة Account
          const Text(
            "Account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 15),

          CustomSettingOptionsGroup(
            options: [
              CustomOption(
                icon: Icons.privacy_tip_rounded,
                title: 'Privacy & Security',
              ),
              CustomOption(
                icon: Icons.subscriptions_outlined,
                title: 'Subscription',
              ),
              CustomOption(
                icon: Icons.question_mark_rounded,
                title: 'Help & Support',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
