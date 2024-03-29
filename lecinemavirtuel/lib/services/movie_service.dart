import 'package:get/get.dart';
import 'package:lecinemavirtuel/models/categoryModel.dart';
import 'package:lecinemavirtuel/models/genreModel.dart';
import 'package:lecinemavirtuel/models/moviePremeireDetails.dart';
import 'package:lecinemavirtuel/models/moviePremiereListModel.dart';
import 'package:lecinemavirtuel/services/api_path.dart';
import 'package:lecinemavirtuel/services/controller/main_controller.dart';
import 'package:lecinemavirtuel/services/http_instance.dart';

class MovieService {
  final _service = HttpInstance.instance;

  Future fetchMovies() async {
    MainController c = Get.put(MainController());
    var result = await _service.getData(path: APIPath.moviePremiereList());
    final decodedData = MoviePremiereListModel.fromJson(result);
    c.setMoviePremiereData(decodedData);

    print('result2 : $result');
  }

  Future fetchGenre() async {
    MainController c = Get.put(MainController());
    final result = await _service.getData(path: APIPath.genre());
    final decodedData = GenreModel.fromJson(result);
    c.setGenreData(decodedData);
    print('result : $result');

    return result;
  }

  Future fetchCategories() async {
    MainController c = Get.put(MainController());
    final result = await _service.getData(path: APIPath.categories());
    print('result2 : $result');
    final decodedData = CategoryModel.fromJson(result);

    c.setCategoryData(decodedData);
    print('result2 : $result');

    return result;
  }

  Future fetchMoviePremiereDetail(id) async {
    print('result2 : $id');
    MainController c = Get.put(MainController());
    var result = await _service.getData(path: APIPath.moviePremiereDetail(id));
    final decodedData = MoviePremiereDetails.fromJson(result);
    c.setMoviePremiereDetails(decodedData);

    print('result2 : ');
  }
}
