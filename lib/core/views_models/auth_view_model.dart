import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvm_usamaa_app/core/services/firestore_user.dart';
import 'package:mvvm_usamaa_app/helper/local_storage_data.dart';
import 'package:mvvm_usamaa_app/models/user_model.dart';
import 'package:mvvm_usamaa_app/views/screens/auth/login_screen.dart';
import 'package:mvvm_usamaa_app/views/screens/control_view.dart';
import 'package:mvvm_usamaa_app/views/screens/home/home_view.dart';

class AuthViewModel extends GetxController {
  // int counter = 0;
  // var counter = 0.obs;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth auth = FirebaseAuth.instance;
  FacebookAuth facebookLogin = FacebookAuth.instance;
  String email = "";
  String password = "";
  String name = "";
  Rxn<User> _user = Rxn<User>();
  get user => _user.value!.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("display nME IS+${auth.currentUser!.displayName}");
    _user.bindStream(auth.authStateChanges());
    if (auth.currentUser! != null) {
      getFirestoreData(auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // void increment() {
  //   counter++;
  // }
  void googleSignInMethod() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await auth.signInWithCredential(credential).then((user) async {
      UserModel userModel = UserModel(
          email: user.user!.email,
          userId: user.user!.uid,
          name: name == "" ? user.user!.displayName : name,
          pic: '');
      await FirestoreUser().addUserToFireStore(userModel);
      Get.offAll(ControlView());
    });
    print(googleUser);
  }

  void signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult =
        await facebookLogin.login(permissions: ['email']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((user) async {
      UserModel userModel = UserModel(
          email: user.user!.email,
          userId: user.user!.uid,
          name: name == null ? user.user!.displayName : name,
          pic: '');
      await FirestoreUser().addUserToFireStore(userModel);
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getFirestoreData(value.user!.uid);
      });
      Get.snackbar("Login valid", "okkkkk");
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar("Login Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithNameAndEmailAndPassword() async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        UserModel userModel = UserModel(
            email: user.user!.email,
            userId: user.user!.uid,
            name: name == null ? user.user!.displayName : name,
            pic: '');
        await FirestoreUser().addUserToFireStore(userModel);
      });
      Get.snackbar("Login valid", "okkkkk");

      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar("Login Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        email: user.user!.email,
        userId: user.user!.uid,
        name: name == null ? user.user!.displayName : name,
        pic: '');
    await FirestoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) {
    LocalStorageData localStorageData = Get.find<LocalStorageData>();

    localStorageData.setUser(userModel);
  }

  getFirestoreData(String uid) async {
    await FirestoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<String, dynamic>));
    });
  }
}
