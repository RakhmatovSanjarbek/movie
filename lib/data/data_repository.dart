import 'package:movie/core/di.dart';
import 'package:movie/data/firebase_helper.dart';
import 'package:movie/data/movie_model.dart';

class DataRepository {
  FirebaseHelper firebaseHelper = di.get<FirebaseHelper>();

  Future addBannerMovie(MovieModel movieModel) async {
    await firebaseHelper.addBannerMovie(MovieModel.toJson(movieModel));
  }

  Future addUzbekMovie(MovieModel movieModel) async {
    await firebaseHelper.addUzbekMovie(MovieModel.toJson(movieModel));
  }

  Future addTranslationMovie(MovieModel movieModel) async {
    await firebaseHelper.addTranslationMovie(MovieModel.toJson(movieModel));
  }
  Future addWorldMovie(MovieModel movieModel) async {
    await firebaseHelper.addWorldMovie(MovieModel.toJson(movieModel));
  }

  Future addIndeaMovie(MovieModel movieModel) async {
    await firebaseHelper.addIndeaMovie(MovieModel.toJson(movieModel));
  }

  Future<List<MovieModel>> getBannerMovie() async {
    List<MovieModel> movieList = [];
    var list = await firebaseHelper.getBannerMovie();
    for (final e in list) {
      movieList.add(MovieModel.fromJson(e.data()));
    }
    return movieList;
  }

  Future<List<MovieModel>> getUzbekMovie() async {
    List<MovieModel> movieList = [];
    var list = await firebaseHelper.getUzbekMovie();
    for (final e in list) {
      movieList.add(MovieModel.fromJson(e.data()));
    }
    return movieList;
  }

  Future<List<MovieModel>> getTranslationMovie() async {
    List<MovieModel> movieList = [];
    var list = await firebaseHelper.getTranslationMovie();
    for (final e in list) {
      movieList.add(MovieModel.fromJson(e.data()));
    }
    return movieList;
  }
  Future<List<MovieModel>> getWorldMovie() async {
    List<MovieModel> movieList = [];
    var list = await firebaseHelper.getWorldMovie();
    for (final e in list) {
      movieList.add(MovieModel.fromJson(e.data()));
    }
    return movieList;
  }

  Future<List<MovieModel>> getIndeaMovie() async {
    List<MovieModel> movieList = [];
    var list = await firebaseHelper.getIndeaMovie();
    for (final e in list) {
      movieList.add(MovieModel.fromJson(e.data()));
    }
    return movieList;
  }

  Future deleteBannerMovie(MovieModel movieModel) async {
    await firebaseHelper.deleteBannerMovie(movieModel.id);
  }

  Future deleteUzbekMovie(MovieModel movieModel) async {
    await firebaseHelper.deleteUzbekMovie(movieModel.id);
  }

  Future deleteTranslationMovie(MovieModel movieModel) async {
    await firebaseHelper.deleteTranslationMovie(movieModel.id);
  }
  Future deleteWorldMovie(MovieModel movieModel) async {
    await firebaseHelper.deleteWorldMovie(movieModel.id);
  }

  Future deleteIndeaMovie(MovieModel movieModel) async {
    await firebaseHelper.deleteIdeaMovie(movieModel.id);
  }

  Future updateUzbekMovie() async {}
}
