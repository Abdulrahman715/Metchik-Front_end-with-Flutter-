// الحالة الابتدائية اول ما نفتح الصفحة
abstract class AuthState {}

// الحالة اللي بيبدأ بيها التطبيق (الزرار ظاهر)
class AuthInitial extends AuthState {}

// حالة التحميل
class AuthLoading extends AuthState {}

// حالة النجاح
class AuthSuccess extends AuthState {}

// حالة الفشل
class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure({required this.errMessage});
}
