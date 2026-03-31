import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/auth/auth_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthLoginCubit extends Cubit<AuthState> {
  AuthLoginCubit() : super(AuthInitial());

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> loginUser({ // نغير الاسم لـ loginUser عشان يكون واضح
    required String email,
    required String password,
  }) async {
    emit(AuthLoading()); // لازم نبعت حالة التحميل أول ما نبدأ
    try {
      // 1. تسجيل الدخول
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. تحديث وقت آخر ظهور فقط (اختياري)
      await firestore.collection('users').doc(userCredential.user!.uid).update({
        'last_login': DateTime.now(),
      });

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      // تحسين رسائل الخطأ لليوزر
      if (e.code == 'user-not-found') {
        emit(AuthFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(errMessage: 'Wrong password provided.'));
      } else {
        emit(AuthFailure(errMessage: e.message ?? 'An error occurred'));
      }
    } catch (e) {
      emit(AuthFailure(errMessage: 'Something went wrong, try again'));
    }
  }
}
