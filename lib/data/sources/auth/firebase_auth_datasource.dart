import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/data/dto/user_dtos.dart';
import 'package:spotify_clone/data/models/user_model.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_datasource.dart';

class FirebaseAuthDataSourceImpl extends AuthDataSource {
  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(SignInReq user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      final loggedUser = userCredential.user;

      if (loggedUser == null) {
        return Left(Failure('User not found'));
      }
      UserModel userModel = UserModel.fromFirebase(loggedUser);
      return Right(userModel);
    } on FirebaseAuthException catch(e){
      String errorMessage = '';
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Invalid email or password.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid credentials.';
      } else {
        errorMessage = 'An unknown error occurred.';
      }

      return Left(Failure(errorMessage));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword(CreateUserReq newUser) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: newUser.email,
        password: newUser.password,
      );
      final registeredUser = userCredential.user;

      if (registeredUser == null) {
        return Left(Failure('User registration failed'));
      }
      UserModel userModel = UserModel.fromFirebase(
        registeredUser,
        fullName: newUser.fullName,
        fcmToken: '',
      );
      FirebaseFirestore.instance.collection('Users').add(userModel.toJson());
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else {
        errorMessage = 'An unknown error occurred.';
      }
      return Left(Failure(errorMessage));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}