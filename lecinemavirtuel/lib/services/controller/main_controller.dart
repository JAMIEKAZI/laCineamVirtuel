import 'package:get/get.dart';
import 'package:lecinemavirtuel/models/categoryModel.dart';
import 'package:lecinemavirtuel/models/genreModel.dart';
import 'package:lecinemavirtuel/models/moviePremeireDetails.dart';
import 'package:lecinemavirtuel/models/moviePremiereListModel.dart';
import 'package:lecinemavirtuel/models/userModel.dart';

class MainController extends GetxController {
  final isLoading = false.obs;
  final userData = UserModel().obs;
  final genreData = GenreModel().obs;
  final categoryData = CategoryModel().obs;
  final moviePremiereList = MoviePremiereListModel().obs;
  final moviePremiereDetails = MoviePremiereDetails().obs;

  void updateLoadingStatus(state) => isLoading.value = state;
  void setUserData(state) => userData.value = state;
  void setGenreData(state) => genreData.value = state;
  void setCategoryData(state) => categoryData.value = state;
  void setMoviePremiereData(state) => moviePremiereList.value = state;
  void setMoviePremiereDetails(state) => moviePremiereDetails.value = state;
}
