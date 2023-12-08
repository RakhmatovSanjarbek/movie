class MovieModel {
  String? id;
  String? movieName;
  String? movieDescretion;
  String? videoUrl;
  String? imagUrl;

  MovieModel(
      this.id,
      this.movieName,
      this.movieDescretion,
      this.videoUrl,
      this.imagUrl);

  static MovieModel fromJson(Map<String, dynamic> row){
    return MovieModel(
      row["id"] as String?,
      row["movieName"] as String?,
      row["movieDescretion"] as String?,
      row["videoUrl"] as String?,
      row["imagUrl"] as String?,
    );
  }

  static Map<String, dynamic> toJson(MovieModel movieModel){
    Map<String, dynamic> row = {
      "id":movieModel.id,
      "movieName":movieModel.movieName,
      "movieDescretion":movieModel.movieDescretion,
      "videoUrl":movieModel.videoUrl,
      "imagUrl":movieModel.imagUrl,
    };
    return row;
  }

}
