import 'package:flutter/material.dart';
import 'package:metchik/widgets/image_and_name_section.dart';
import 'package:metchik/widgets/custom_profile_options_group.dart';
import 'package:metchik/widgets/custom_option.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ImageAndNameSection(),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          CustomProfileOptionsGroup(
            options: [
              CustomOption(
                onTap: () {},
                icon: Icons.person_outline,
                title: 'Account Information',
              ),
              CustomOption(
                onTap: () {},
                icon: Icons.shopping_bag_outlined,
                title: 'My Orders',
              ),
              CustomOption(
                icon: Icons.location_on_outlined,
                title: 'Address Management',
              ),
              CustomOption(icon: Icons.settings_outlined, title: 'Setting'),
              CustomOption(icon: Icons.lock_outline, title: 'Password Manager'),
            ],
          ),

          const SizedBox(height: 25),

          // 3. Support Section
          const Text(
            'Support',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          CustomProfileOptionsGroup(
            options: [
              CustomOption(
                onTap: () {},
                icon: Icons.help_outline,
                title: 'Help Center',
              ),
              CustomOption(
                onTap: () {},
                icon: Icons.logout,
                title: 'Logout',
                isLogout: true,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
