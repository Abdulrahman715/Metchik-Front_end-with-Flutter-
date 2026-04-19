# 🛍️ Metchik - Modern E-Commerce App 📱

A professional E-Commerce Application built with Flutter, focused on clean architecture, high performance, and seamless user experience.
This project follows SOLID principles and Clean Code standards to ensure scalability 🚀.

تطبيق متجر إلكتروني متكامل باستخدام Flutter، يعتمد على معمارية برمجية نظيفة وربط كامل مع Firebase لإدارة المستخدمين مع نظام متطور لإدارة الحالة (State Management).



### تحميل التطبيق 📥
يمكنك تحميل أحدث نسخة تجريبية من التطبيق (APK) من الرابط التالي:
[اضغط هنا لتحميل App Release](https://github.com/Abdulrahman715/News_App/releases/download/v1.0.0/release-apk.zip)

> **ملاحظة:** الملف مضغوط بصيغة ZIP، بعد التحميل فك الضغط عنه وهتلاقي ملف الـ APK جواه.
---



✅ Current Progress (ما تم إنجازه)

### 🎨 UI & Design
- [x] تصميم واجهة المنتجات الرئيسية (Products View).
- [x] arguments بناء صفحة تفاصيل المنتج ودعم الـ  (Product Details) .
- [x] Grid تصميم صفحة المفضلة بنظام الـ
- [x] إنشاء واجهة العربة مع متحكمات الكمية (Cart UI).
- [x] تصميم صفحة البروفايل والإعدادات بشكل عصري ومقسم لمجموعات. (Profile & setting) 
- [x] احترافي للتنقل بين أقسام التطبيق الأساسية Bottom Navigation Bar .

🔐 Firebase & Backend
- [x] Firebase Authentication ربط التطبيق ب .
- [x] إنشاء صفحات تسجيل الدخول وإنشاء الحساب (Register & Login).
- [x] إدارة حالة المستخدم (User Session) والتأكد من بقاء الجلسة نشطة.
- [x] (قيد التنفيذ) ربط بيانات المنتجات والطلبات بـ Cloud Firestore.

🧠 State Management (BLoC/Cubit)
- [x] استخدامه لإدارة ثيم التطبيق (Dark/Light Mode).
- [x] إدارة منطق العربة بالكامل (إضافة، مسح، تحديث الكمية والسعر الإجمالي) (Cart Logic) .
- [x]نظام المفضلة لإضافة وحذف المنتجات لحظيا اً (Favorites Cubit). 
- [x] Use MultiBlocProvider to handle providers of the top pf the widgets

🔄 Navigation & UX
- [x] use NamedRoutes لتنظيم التنقل بين الشاشات.
- [x] Hide Bottom Navigation Bar   لتحسين فى صفحات معينة مثل صفحة العربة
- [x] دعم الـ Dark Mode وتغييره من داخل إعدادات البروفايل مع حفظ الحالة.


**Available Categories:**
- Men  
- Womens  
- Kids  
- Bags

**🛠️ Technologies & Tools:**
- Framework: Flutter & Dart.  
- State Management: Flutter BLoC / Cubit.  
- Local Storage: Hive / Shared Preferences.  
- Architecture: Clean Architecture & SOLID Principles.
- Navigation: Named Routes & Material Page Routes.

![Demo_of_the_project](assets/demo/metchik.MP4)

---

## 📚 What I Learned From This Project

* **Clean Code Architecture:** تطبيق مبادئ الكود النظيف في المشاريع الكبيرة لضمان سهولة الصيانة والتطوير.
* **State Management (Cubit):** إدارة الحالات المعقدة والمداخلة (Nested States) بكفاءة عالية.
* **Firebase Integration:** التعامل الاحترافي مع نظام Firebase Authentication لتأمين بيانات المستخدمين.
* **Dynamic Navigation:** بناء نظام تنقل (Navigation) مرن يتحكم بدقة في ظهور وإخفاء الـ Bottom Bar حسب الحاجة.
* **Data Passing:** احتراف تمرير البيانات المعقدة بين الصفحات باستخدام الـ Arguments.
* **API Management:** التعامل مع REST APIs وفصل منطق جلب البيانات عن واجهة المستخدم (UI).
* **Performance Optimization:** استخدام الـ Slivers لبناء واجهات مرنة وتحسين الأداء من خلال الـ Pagination.

---

## 🔮 Next Steps (الخطوات القادمة)

- [ ] **Checkout System:** إكمال نظام الدفع وعملية الـ Checkout بالكامل.
- [ ] **Push Notifications:** إضافة نظام إشعارات لحظي للتفاعل مع المستخدمين.
- [ ] **Image Caching:** تحسين تجربة المستخدم وسرعة التطبيق باستخدام Cache للصور.
- [ ] **Advanced Search:** إضافة خاصية البحث المتقدم بفلترة دقيقة.
- [ ] **Dark Mode:** دعم الوضع الليلي لتحسين تجربة القراءة.
- [ ] **Offline Mode:** تفعيل خاصية تخزين البيانات محلياً (Caching) للعمل بدون إنترنت.

---

## 👨‍💻 Author

**Abdulrahman Muhammad Nagiub**
*Flutter Developer | Software Engineer 🚀*
*Graduate of the Faculty of Computers and Information, Minia University*
