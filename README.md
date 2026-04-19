# 🛍️ Metchik - Modern E-Commerce App

Metchik هو تطبيق تجارة إلكترونية متكامل ومطور باستخدام Flutter، يركز على تقديم تجربة مستخدم (UX) سلسة ومعمارية كود نظيفة (Clean Code) تعتمد على مبادئ SOLID.

🚀 المميزات التقنية المتقدمة (Advanced Technical Features)
1. نظام الهوية والمصادقة (Firebase Authentication)
Login & Register: دمج كامل مع Firebase Auth لإدارة حسابات المستخدمين بأمان.

Real-time Validation: التحقق من البيانات المدخلة لحظياً لضمان دقة معلومات التسجيل.

State Persistence: الحفاظ على حالة تسجيل الدخول للمستخدم لضمان تجربة دخول سريعة ومستمرة.

2. هيكلية التنقل (Navigation Architecture)
Bottom Navigation Bar: تنفيذ نظام تنقل رئيسي يربط بين أقسام التطبيق (Home, Favorites, Profile) بسهولة.

Smart UI Control: برمجة مخصصة لإخفاء الـ Bottom Bar في صفحات معينة (مثل صفحة العربة/Cart) لتقليل التشتت وتحسين الـ User Flow أثناء عملية الشراء.

Named Routing: استخدام نظام الـ Routes المنظمة للتنقل بين الصفحات مع تمرير البيانات (Arguments) بكفاءة.

3. إدارة الحالة المتقدمة (State Management with BLoC)
استخدام Cubit/Bloc لإدارة (Cart, Favorites, Theme, Auth) بشكل منفصل ومنظم.

MultiBlocProvider: إدارة مركزية للحالات لضمان تحديث الواجهات فورياً في أي مكان بالتطبيق.

4. نظام العربة الذكي (Advanced Cart Logic)
دعم إضافة المنتجات بتخصيصات دقيقة (المقاس، اللون، الكمية).

منطق برمجي يمنع تكرار المنتجات ويدير الكميات والأسعار الإجمالية بدقة عالية.

5. التحكم في المظهر والـ UI
Dynamic Dark/Light Mode: تبديل كامل للثيم مع حفظ الاختيارات.

Responsive Design: واجهات متجاوبة تعتمد على أحدث أساليب التصميم لضمان عملها على مختلف أحجام الشاشات.

🛠️ التقنيات المستخدمة (Tech Stack)
Framework: Flutter

Backend: Firebase (Authentication & Cloud Firestore)

State Management: Flutter BLoC / Cubit

Local Database: Hive / Shared Preferences

Architecture: Clean Architecture

📸 معرض الصور (Screenshots)
(هنا تضع صور صفحات الـ Login، الـ Register، الـ Bottom Bar، والـ Profile)

👨‍💻 مطور المشروع (Developer)
تم تطوير هذا المشروع بواسطة المهندس عبدالرحمن محمد نجيب، خريج كلية الحاسبات والمعلومات بجامعة المنيا، والمتخصص في تطوير تطبيقات الموبايل باستخدام Flutter.
