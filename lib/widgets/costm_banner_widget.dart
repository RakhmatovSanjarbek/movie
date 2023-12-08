import 'package:flutter/material.dart';
import 'package:movie/data/movie_model.dart';

class CostmBannerWidget extends StatelessWidget {
  const CostmBannerWidget({super.key, required this.movieModel, required this.onTap, required this.onLongPress});
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
        width: 380.0,
        // color: Colors.green,
        margin: const EdgeInsets.only(left: 16.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                movieModel.imagUrl??"",
                width: 380.0,
                height: 192.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 88.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieModel.movieName??"",
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    movieModel.movieDescretion??"",
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
