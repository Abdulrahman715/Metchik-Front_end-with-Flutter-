import 'package:flutter/material.dart';
import 'package:metchik/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String id = 'profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
        title: Text('Profile' , style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ProfileBody(),
    );
  }
}
