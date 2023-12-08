import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../../data/movie_model.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("saqlanganlar-oynasi".tr(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xff0509d3),
      ),
      body: Consumer<AppProvider>(
        builder: (context, savedMoviesProvider, _) {
          List<MovieModel> savedMovies = savedMoviesProvider.savedMovies.toList();
          return savedMovies.length==0?Center(
            child: Lottie.asset('assets/empty.json')
          ):ListView.builder(
            itemCount: savedMovies.length,
            itemBuilder: (context, index) {
              MovieModel movie = savedMovies[index];
              return GestureDetector(
                onTap: () {
                  // widget.onTap.call();
                },
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  height: 120.0,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          movie.imagUrl ?? "",
                          width: 160.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              movie.movieName ?? "",
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              movie.movieDescretion ?? "",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color(0xffb0b0b0),
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<AppProvider>(context, listen: false).removeFromSavedList(movie);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                      ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
