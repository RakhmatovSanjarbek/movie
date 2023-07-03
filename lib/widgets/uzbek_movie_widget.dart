import 'package:flutter/material.dart';
import 'package:movie/pages/all_movies_page/All_uzbek_movies.dart';

class UzbekMovieWidget extends StatelessWidget {
  const UzbekMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "O'zbek kino",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const AllUzbekMovies()));
                },
                child: const Text(
                  "Barchasi",
                  style: TextStyle(
                    color: Color(0xff0509d3),
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 192.0,
          // color: Colors.blue,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                          "https://i.ytimg.com/vi/YVzms2PDeoM/maxresdefault.jpg",
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        "Shoqol",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Shoqol (o'zbek film)",
                        style:
                        TextStyle(fontSize: 12.0, color: Color(
                            0xffb0b0b0),fontWeight: FontWeight.w500),
                        maxLines: 2,
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
