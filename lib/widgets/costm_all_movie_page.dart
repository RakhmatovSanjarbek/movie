import 'package:flutter/material.dart';
import 'package:movie/data/movie_model.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

class CostmMovies extends StatefulWidget {
  const CostmMovies({Key? key, required this.movieModel, required this.onTap});
  final MovieModel movieModel;
  final Function onTap;

  @override
  State<CostmMovies> createState() => _CostmMoviesState();
}

class _CostmMoviesState extends State<CostmMovies> {
  List<MovieModel> movieList = [];
  List<MovieModel> savedList = [];



  @override
  Widget build(BuildContext context) {
    bool isSaved = Provider.of<AppProvider>(context).savedMovies.contains(widget.movieModel);
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
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
                widget.movieModel.imagUrl ?? "",
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
                    widget.movieModel.movieName ?? "",
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
                    widget.movieModel.movieDescretion ?? "",
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
                Provider.of<AppProvider>(context, listen: false).toggleSaved(widget.movieModel);
                },
              icon: Icon(
                isSaved  ? Icons.favorite : Icons.favorite_border,
                color: isSaved  ? Colors.red : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}