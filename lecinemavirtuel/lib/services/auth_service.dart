import 'package:get/get.dart';
import 'package:lecinemavirtuel/models/categoryModel.dart';
import 'package:lecinemavirtuel/models/changePasswordModel.dart';
import 'package:lecinemavirtuel/models/editProfileModel.dart';
import 'package:lecinemavirtuel/models/genreModel.dart';
import 'package:lecinemavirtuel/models/signinModel.dart';
import 'package:lecinemavirtuel/models/signupModel.dart';
import 'package:lecinemavirtuel/models/userModel.dart';
import 'package:lecinemavirtuel/services/controller/main_controller.dart';

import 'api_path.dart';
import 'http_instance.dart';
import 'localStorage.dart';

// class User {
//   User({@required this.token});
//   final String token;
// }

LocalStorage localStorage = LocalStorage();

class AuthService {
  final _service = HttpInstance.instance;

  Future signIn(SigninModel payload) async {
    final authResult = await _service.postData(APIPath.userSignIn(), payload);
    // final decodedData = UserModel.fromJson(authResult);
    print('result : $authResult');
    await localStorage.setData(name: 'token', data: authResult['token']);
    await fetchProfile();
  }

  Future signUp(SignupModel payload) async {
    final authResult = await _service.postData(APIPath.userSignUp(), payload);
    // final decodedData = UserModel.fromJson(authResult);
    print('result : $authResult');
  }

  Future upateAccount(EditProfileModel payload) async {
    final authResult =
        await _service.patchData(APIPath.updateAccount(), payload);
    await fetchProfile();
    // final decodedData = UserModel.fromJson(authResult);
    print('result : $authResult');
  }

  Future forgotPassword(dynamic payload) async {
    final authResult =
        await _service.postData(APIPath.forgotPassword(), payload);

    // final decodedData = UserModel.fromJson(authResult);
    print('result : $authResult');
  }

  Future updatePassword(ChangePasswordModel payload) async {
    final authResult =
        await _service.postData(APIPath.updatePassword(), payload);

    // final decodedData = UserModel.fromJson(authResult);
    print('result : $authResult');
  }

  Future fetchCountries() async {
    final result = await _service.getData(path: APIPath.countries());
    // final decodedData = UserModel.fromJson(result);
    print('result : $result');

    return result;
  }

  Future fetchProfile() async {
    MainController c = Get.put(MainController());
    final result = await _service.getData(path: APIPath.profile());
    final decodedData = UserModel.fromJson(result['data']);
    c.setUserData(decodedData);
    print('result : $result');

    return decodedData;
  }
}
