import 'package:flutter/material.dart';
import 'package:movie/data/movie_model.dart';

class CostmMovieWidget extends StatelessWidget {
  const CostmMovieWidget({super.key, required this.movieModel, required this.onTap, required this.onLongPress});
  final MovieModel movieModel;
  final Function onTap;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        onLongPress.call();
      },
      onTap: () {
        onTap.call();
      },
      child: Container(
        height: double.infinity,
        width: 120.0,
        // color: Colors.green,
        margin: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                movieModel.imagUrl??"",
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              movieModel.movieName??"",
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
            Text(
              movieModel.movieDescretion??"",
              style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xffb0b0b0),
                  fontWeight: FontWeight.w500),
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
