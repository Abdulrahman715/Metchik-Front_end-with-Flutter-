import 'package:flutter/material.dart';

class OffersList extends StatelessWidget {
  const OffersList({
    super.key,
    required this.precentage,
    required this.subtitle,
    required this.code,
    required this.image,
  });

  final String precentage;
  final String subtitle;
  final String code;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // ياخد أغلب عرض الشاشة
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[200]
            : Colors.grey[800],
        child: Stack(
          // استخدمنا Stack عشان نحط الصورة على اليمين والنص على الشمال
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$precentage % Off',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'On $subtitle',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Use code: $code',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Get Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // هنا تضيف صورة الـ Promo على اليمين
            Positioned(
              right: -40,
              bottom: -10,
              child: Image.network(
                image,
                height: 240,
                width: 240,
              ), // مثلاً
            ),
          ],
        ),
      ),
    );
  }
}
