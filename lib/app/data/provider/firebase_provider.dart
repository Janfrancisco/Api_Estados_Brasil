import 'package:api_getx_estados_br/app/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Get request
  Future<UserModel> getUser(String id) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();
      return UserModel.fromDocumentSnapshot(doc);
    } on Exception catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<bool> createUser(UserModel userModel) async {
    try {
      await _firestore.collection('users').doc(userModel.id).set({
        'name': userModel.name,
        'surname': userModel.surname,
        'email': userModel.email,
      });
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

/* // Post request
  Future<Response> postUser(Map data) =>
      post('http://youapi/users', body: data);
// Post request with File
  Future<Response<CasesModel>> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  } */
}
