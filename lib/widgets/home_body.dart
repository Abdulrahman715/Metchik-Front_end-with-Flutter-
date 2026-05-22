import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';
import 'package:metchik/views/login_view.dart';
import 'package:metchik/views/products_view.dart';
import 'package:metchik/views/register_view.dart';
import 'package:metchik/widgets/custom_elevated_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _isImageLoading = true; // متغير نتحكم فيه في الـ Skeletonizer

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),

            // 1. استخدام SizedBox لحجز المساحة ومنع النطة
            SizedBox(
              width: 600,
              height: 380, // نفس ارتفاع اللوجو المتوقع
              child: Skeletonizer(
                enabled: _isImageLoading, // هيشتغل طول ما الصورة بتحمل
                child: Image.network(
                  kLogo,
                  width: 400,
                  height: 200,
                  fit: BoxFit.contain,
                  // 2. أول ما الصورة تحمل أو يحصل أول Frame، بنقفل الـ Skeleton
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                        if (frame != null && _isImageLoading) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() => _isImageLoading = false);
                          });
                        }
                        return child;
                      },
                  // في حالة الفشل بنقفل التحميل برضه عشان ميقفلش الشاشة
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 100);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            CustomElevatedButton(
              onPressed: () => Navigator.pushNamed(context, ProductsView.id),
              word: 'Guest',
            ),
            CustomElevatedButton(
              onPressed: () => Navigator.pushNamed(context, RegisterView.id),
              word: 'Register',
            ),
            CustomElevatedButton(
              onPressed: () => Navigator.pushNamed(context, LoginView.id),
              word: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
