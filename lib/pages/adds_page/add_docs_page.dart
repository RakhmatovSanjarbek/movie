import 'package:flutter/material.dart';
import 'package:movie/pages/adds_page/add_banner_page.dart';
import 'package:movie/pages/adds_page/add_indea_movie_page.dart';
import 'package:movie/pages/adds_page/add_translation_page.dart';
import 'package:movie/pages/adds_page/add_uzbek_movie_page.dart';
import 'package:movie/pages/adds_page/add_world_movie_page.dart';

class AddDocsPage extends StatelessWidget {
  const AddDocsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Kino va banner qo'shish",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff0509d3),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddBannerPage(movieModel: null,)));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                      "https://t3.ftcdn.net/jpg/05/57/03/66/360_F_557036673_z3bbYkLNh4AiYFhTPlfXRdjZpR1Br4fm.jpg",
                          width: double.infinity,
                      height: 180.0,
                          fit: BoxFit.cover,
                    )),
                  ),
                  const Text("Bannerlar qo'shish",style: TextStyle(color: Colors.white,fontSize: 32.0,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddUzbekMoviePage(movieModel: null,)));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                      "https://static.vecteezy.com/system/resources/previews/014/371/500/original/green-technology-background-creative-lighting-template-background-free-vector.jpg",
                          width: double.infinity,
                      height: 180.0,
                          fit: BoxFit.cover,
                    )),
                  ),
                  const Text("O'zbek kino qo'shish",style: TextStyle(color: Colors.white,fontSize: 32.0,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddTranslationPage(movieModel: null)));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                      "https://t4.ftcdn.net/jpg/03/67/71/03/360_F_367710394_oXQ0risOnwXjMEo9RKab42ffOdmdHenv.jpg",
                          width: double.infinity,
                      height: 180.0,
                          fit: BoxFit.cover,
                    )),
                  ),
                  const Text("Tarjima kino qo'shish",style: TextStyle(color: Colors.white,fontSize: 32.0,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddWorldMoviePage(movieModel: null)));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                      "https://as1.ftcdn.net/v2/jpg/04/82/00/64/1000_F_482006484_dj1tjkcNnup8twuvtVKYfui2xh2CsBmm.jpg",
                          width: double.infinity,
                      height: 180.0,
                          fit: BoxFit.cover,
                    )),
                  ),
                  const Text("Jahon kinosini qo'shish",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddIndeaMoviePage(movieModel: null)));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                      "https://as2.ftcdn.net/v2/jpg/04/82/00/63/1000_F_482006377_o4O1ybNF8EWKm1S3uIOtja4tdlEnHYxz.jpg",
                          width: double.infinity,
                      height: 180.0,
                          fit: BoxFit.cover,
                    )),
                  ),
                  const Text("Hind kinosini qo'shish",style: TextStyle(color: Colors.white,fontSize: 32.0,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
