import 'package:api_getx_estados_br/app/app_bindings.dart';
import 'package:api_getx_estados_br/app/data/model/user_model.dart';
import 'package:api_getx_estados_br/app/data/repository/user_repository.dart';
import 'package:api_getx_estados_br/app/modules/authentication/screens/welcome_page.dart';
import 'package:api_getx_estados_br/app/modules/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final UserRepository repository;
  AuthController(this.repository);

  FirebaseAuth _auth = FirebaseAuth.instance;
  /* final _usermodel = UserModel().obs;
  set usermodel(value) => this._usermodel.value = value;
  get usermodel => this.usermodel.value; */
  //get auth => this._auth;
  User user;

  void createUser(String name, String surname, String email, String password) {
    //usando promises
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      UserModel usrModel = UserModel(
          id: _auth.currentUser.uid,
          name: name,
          surname: surname,
          email: email);
      repository.addUser(usrModel);
      user = _auth.currentUser;
      //usermodel(usrModel);
      Get.offAll(() => HomePage(), binding: HomeBinding(), arguments: name);
    }).catchError((onError) {
      Get.snackbar("Erro durante o processo", onError.message);
    });
  }

  void login(String email, String password) async {
    //usando promises o método getUser() apresenta erro
    /* await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      UserModel userModel = repository.getUser(_auth.currentUser.uid);

      Get.offAll(() => HomePage(),
          binding: HomeBinding(), arguments: userModel.getName);
    }).catchError((onError) {
      Get.snackbar("Erro durante o processo", onError.message);
    }); */
    // usando try-catch
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // nextPage();
      UserModel usermodel = await repository.getUser(_auth.currentUser.uid);
      user = _auth.currentUser;
      Get.offAll(() => HomePage(),
          binding: HomeBinding(), arguments: usermodel.getName);
    } on Exception catch (e) {
      Get.snackbar("Erro durante o processo", e.toString());
    }
  }

  void signout() async {
    await _auth.signOut().then((value) {
      Get.offAll(() => WelcomePage());
    });
  }
}
