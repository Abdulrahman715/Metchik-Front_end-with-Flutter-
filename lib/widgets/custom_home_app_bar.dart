import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_icon_button.dart';

AppBar customHomeAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent, // شفاف عشان يبان زي الصورة
    elevation: 0,
    automaticallyImplyLeading: false, // عشان نتحكم في المسافات براحتنا
    title: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            tooltip: 'Settings',
            icon: Icons.sort,
            onPressed: () {
              // Handle sort button press
            },
          ),
          // هنا ممكن تحط الـ CircleAvatar بتاعت صورتك اللي في التصميم بدل زرار العربة
          const CircleAvatar(
            minRadius: 25,
            backgroundImage: NetworkImage(
              'https://res.cloudinary.com/duwfy7ale/image/upload/q_auto/f_auto/v1775133520/download_wd9ups.jpg',
            ),
          ),
        ],
      ),
    ),
  );
}
