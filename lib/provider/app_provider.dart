

import 'package:flutter/foundation.dart';
import 'package:movie/core/di.dart';
import 'package:movie/data/data_repository.dart';
import 'package:movie/data/movie_model.dart';
import 'package:movie/data/shared_preferences_helper.dart';

enum LoadingStatus { initial, loading, completed }

class AppProvider extends ChangeNotifier {
  List<MovieModel> _bannerMovieList = [];
  List<MovieModel> _uzbekMovieList = [];
  List<MovieModel> _translationMovieList = [];
  List<MovieModel> _worldMovieList = [];
  List<MovieModel> _indeaMovieList = [];
  LoadingStatus _loadingStatus = LoadingStatus.initial;
  String? _nikName;
  String? _name;
  String? _firstName;
  bool _isLogin = false;
  int _selectLang = 0;

  int get selectLang => _selectLang;

  set selectLang(int value) {
    _selectLang = value;
    notifyListeners();
  }

  Set<MovieModel> _savedMovies = {};

  Set<MovieModel> get savedMovies => _savedMovies;

  void toggleSaved(MovieModel movie) {
    if (_savedMovies.contains(movie)) {
      _savedMovies.remove(movie);
    } else {
      _savedMovies.add(movie);
    }
    notifyListeners();
  }

  void removeFromSavedList(MovieModel movie) {
    _savedMovies.remove(movie);
    notifyListeners();
  }



  String? get nikName => _nikName;

  void nikNameText(String newText) {
    _nikName = newText;
    notifyListeners();
  }

  String? get firstName => _firstName;

  void firstNameText(String newText) {
    _firstName = newText;
    notifyListeners();
  }

  String? get name => _name;

  void nameText(String newText) {
    _name = newText;
    notifyListeners();
  }

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }



  String? _age;
  String? _sex;




  final dataRepository = di.get<DataRepository>();

  List<MovieModel> get bannerMovieList => _bannerMovieList;

  set bannerMovieList(List<MovieModel> value) {
    _bannerMovieList = value;
    notifyListeners();
  }

  List<MovieModel> get uzbekMovieList => _uzbekMovieList;

  set uzbekMovieList(List<MovieModel> value) {
    _uzbekMovieList = value;
    notifyListeners();
  }

  List<MovieModel> get translationMovieList => _translationMovieList;

  set translationMovieList(List<MovieModel> value) {
    _translationMovieList = value;
    notifyListeners();
  }

  List<MovieModel> get worldMovieList => _worldMovieList;

  set worldMovieList(List<MovieModel> value) {
    _worldMovieList = value;
    notifyListeners();
  }

  List<MovieModel> get indeaMovieList => _indeaMovieList;

  set indeaMovieList(List<MovieModel> value) {
    _indeaMovieList = value;
    notifyListeners();
  }


  String? get age => _age;

  set age(String? value) {
    _age = value;
    notifyListeners();
  }

  String? get sex => _sex;

  set sex(String? value) {
    _sex = value;
    notifyListeners();
  }

  LoadingStatus get loadingStatus => _loadingStatus;

  set loadingStatus(LoadingStatus value) {
    _loadingStatus = value;
    notifyListeners();
  }

  Future getBannerMovies() async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository
        .getBannerMovie()
        .then((value) => bannerMovieList = value);
    loadingStatus = LoadingStatus.completed;
  }

  Future getUzbekAllMovies() async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository
        .getUzbekMovie()
        .then((value) => uzbekMovieList = value);
    loadingStatus = LoadingStatus.completed;
  }

  Future getTranslationMovive() async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository
        .getTranslationMovie()
        .then((value) => translationMovieList = value);
    loadingStatus = LoadingStatus.completed;
  }

  Future getWorldMovies() async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository
        .getWorldMovie()
        .then((value) => worldMovieList = value);
    loadingStatus = LoadingStatus.completed;
  }

  Future getIndeaMovive() async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository
        .getIndeaMovie()
        .then((value) => indeaMovieList = value);
    loadingStatus = LoadingStatus.completed;
  }

  Future addBannerMovie(String movieName, String movieDescretion,
      String videoUrl, String imagUrl) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    MovieModel movieModel =
    MovieModel("", movieName, movieDescretion, videoUrl, imagUrl);
    await dataRepository.addBannerMovie(movieModel);
    getBannerMovies();
  }

  Future addUzbekMovie(String movieName, String movieDescretion,
      String videoUrl, String imagUrl) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    MovieModel movieModel =
    MovieModel("", movieName, movieDescretion, videoUrl, imagUrl);
    await dataRepository.addUzbekMovie(movieModel);
    getUzbekAllMovies();
  }

  Future addTranslationMovie(String movieName, String movieDescretion,
      String videoUrl, String imagUrl) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    MovieModel movieModel =
    MovieModel("", movieName, movieDescretion, videoUrl, imagUrl);
    await dataRepository.addTranslationMovie(movieModel);
    getTranslationMovive();
  }

  Future addWorldMovie(String movieName, String movieDescretion,
      String videoUrl, String imagUrl) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    MovieModel movieModel =
    MovieModel("", movieName, movieDescretion, videoUrl, imagUrl);
    await dataRepository.addWorldMovie(movieModel);
    getWorldMovies();
  }

  Future addIndeaMovie(String movieName, String movieDescretion,
      String videoUrl, String imagUrl) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    MovieModel movieModel =
    MovieModel("", movieName, movieDescretion, videoUrl, imagUrl);
    await dataRepository.addIndeaMovie(movieModel);
    getIndeaMovive();
  }

  Future deleteBannerMovie(MovieModel movieModel) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository.deleteBannerMovie(movieModel);
    loadingStatus = LoadingStatus.loading;
    getBannerMovies();
  }

  Future deleteUzbekMovie(MovieModel movieModel) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository.deleteUzbekMovie(movieModel);
    loadingStatus = LoadingStatus.loading;
    getUzbekAllMovies();
  }

  Future deleteTranslationMovie(MovieModel movieModel) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository.deleteTranslationMovie(movieModel);
    loadingStatus = LoadingStatus.loading;
    getTranslationMovive();
  }

  Future deleteWorldMovie(MovieModel movieModel) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository.deleteWorldMovie(movieModel);
    loadingStatus = LoadingStatus.loading;
    getWorldMovies();
  }

  Future deleteIndeaMovie(MovieModel movieModel) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    await dataRepository.deleteIndeaMovie(movieModel);
    loadingStatus = LoadingStatus.loading;
    getIndeaMovive();
  }

  Future<int> updateMovie(MovieModel movieModel) async {
    if (loadingStatus != LoadingStatus.loading) {
      loadingStatus = LoadingStatus.loading;
    }
    int result = 0;
    return result;
  }

  getIsLogin(){
    return SharedPreferencesHelper.getIsLogin();
  }

  void setISLogin(bool value){
    SharedPreferencesHelper.setIsLogin(value);
  }
}
