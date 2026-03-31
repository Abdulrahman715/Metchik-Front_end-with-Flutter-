import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/auth/auth_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRegisterCubit extends Cubit<AuthState> {
  AuthRegisterCubit() : super(AuthInitial());

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> requisterUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    try {
      //! create account in firebase
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //! store data of user in firestore
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'createdAt': DateTime.now(),
      });

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }
}
