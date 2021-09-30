import 'package:api_getx_estados_br/app/data/provider/firebase_provider.dart';

class UserRepository {
  final ApiFirebase api;

  UserRepository(this.api);

  getUser(String id) {
    return api.getUser(id);
  }

  addUser(user) {
    return api.createUser(user);
  }
}
