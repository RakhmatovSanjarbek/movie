import 'package:flutter/material.dart';
import 'package:movie/data/movie_model.dart';
import 'package:movie/pages/adds_page/add_indea_movie_page.dart';
import 'package:movie/pages/adds_page/add_translation_page.dart';
import 'package:movie/pages/adds_page/add_uzbek_movie_page.dart';
import 'package:movie/pages/adds_page/add_world_movie_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../pages/adds_page/add_banner_page.dart';

class ShowMovieFunction {
  void showBannerInfo(MovieModel movieModel, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  movieModel.movieName ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movieModel.movieDescretion ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        deleteBannerMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'chirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        editBannerMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'zgartirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void deleteBannerMovie(MovieModel movieModel, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(" Diqqat!"),
            content: Text(
                "Siz haqiqatdan ham ${movieModel.movieName} nomli kinoni o'chirmoqchimisiz"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Yo'q"),
              ),
              TextButton(
                onPressed: () {
                  context.read<AppProvider>().deleteBannerMovie(movieModel);
                  Navigator.pop(context);
                },
                child: const Text("Ha"),
              ),
            ],
          );
        });
  }

  void editBannerMovie(MovieModel movieModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddBannerPage(
          movieModel: movieModel,
        ),
      ),
    );
  }

  void showUzbekInfo(MovieModel movieModel, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  movieModel.movieName ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movieModel.movieDescretion ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        deleteUzbekMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'chirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        editUzbekMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'zgartirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void deleteUzbekMovie(MovieModel movieModel, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(" Diqqat!"),
            content: Text(
                "Siz haqiqatdan ham ${movieModel.movieName} nomli kinoni o'chirmoqchimisiz"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Yo'q"),
              ),
              TextButton(
                onPressed: () {
                  context.read<AppProvider>().deleteUzbekMovie(movieModel);
                  Navigator.pop(context);
                },
                child: const Text("Ha"),
              ),
            ],
          );
        });
  }

  void editUzbekMovie(MovieModel movieModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddUzbekMoviePage(
          movieModel: movieModel,
        ),
      ),
    );
  }

  void showTranslationInfo(MovieModel movieModel, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  movieModel.movieName ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movieModel.movieDescretion ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        deleteTranslationMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'chirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        editTranslationMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'zgartirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void editTranslationMovie(MovieModel movieModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTranslationPage(
          movieModel: movieModel,
        ),
      ),
    );
  }

  void deleteTranslationMovie(MovieModel movieModel, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(" Diqqat!"),
          content: Text(
              "Siz haqiqatdan ham ${movieModel.movieName} nomli kinoni o'chirmoqchimisiz"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Yo'q"),
            ),
            TextButton(
              onPressed: () {
                context.read<AppProvider>().deleteTranslationMovie(movieModel);
                Navigator.pop(context);
              },
              child: const Text("Ha"),
            ),
          ],
        );
      },
    );
  }

  void showWorldInfo(MovieModel movieModel, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  movieModel.movieName ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movieModel.movieDescretion ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        deleteWorldMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'chirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        editWorldMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'zgartirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void deleteWorldMovie(MovieModel movieModel, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(" Diqqat!"),
          content: Text(
              "Siz haqiqatdan ham ${movieModel.movieName} nomli kinoni o'chirmoqchimisiz"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Yo'q"),
            ),
            TextButton(
              onPressed: () {
                context.read<AppProvider>().deleteWorldMovie(movieModel);
                Navigator.pop(context);
              },
              child: const Text("Ha"),
            ),
          ],
        );
      },
    );
  }

  void editWorldMovie(MovieModel movieModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddWorldMoviePage(
          movieModel: movieModel,
        ),
      ),
    );
  }

  void showIndeadInfo(MovieModel movieModel, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  movieModel.movieName ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movieModel.movieDescretion ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        deleteIndeaMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'chirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        editIndeaMovie(movieModel, context);
                      },
                      child: Container(
                        height: 48.0,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color(0xFF9F0606),
                        ),
                        child: const Text(
                          "O'zgartirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void deleteIndeaMovie(MovieModel movieModel, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(" Diqqat!"),
          content: Text(
              "Siz haqiqatdan ham ${movieModel.movieName} nomli kinoni o'chirmoqchimisiz"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Yo'q"),
            ),
            TextButton(
              onPressed: () {
                context.read<AppProvider>().deleteIndeaMovie(movieModel);
                Navigator.pop(context);
              },
              child: const Text("Ha"),
            ),
          ],
        );
      },
    );
  }

  void editIndeaMovie(MovieModel movieModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddIndeaMoviePage(
          movieModel: movieModel,
        ),
      ),
    );
  }
}
