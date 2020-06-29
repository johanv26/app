import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_login_ui/User/model/user.dart';
import 'package:app_login_ui/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
}
