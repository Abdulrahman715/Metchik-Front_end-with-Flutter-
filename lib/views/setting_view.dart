import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_setting_app_bar.dart';
import 'package:metchik/widgets/setting_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  static const String id = 'setting_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSettingAppBar(
        searchOnPressed: () {},
        readOnPressed: () {},
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SettingBody(),
    );
  }
}
