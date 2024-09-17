


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/MovieData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Movie> list = [];

  /*var movie1 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie2 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie3 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie4 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie5 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie6 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie7 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie8 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie9 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie10 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie11 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");
  var movie12 = new Movie(id: 1, title: "ABS", poster_path: "poster_path");

  List<Movie> getAllMovies(){
    list.add(movie1);
    list.add(movie2);
    list.add(movie3);
    list.add(movie4);
    list.add(movie5);
    list.add(movie6);
    list.add(movie7);
    list.add(movie8);
    list.add(movie9);
    list.add(movie10);
    list.add(movie11);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);
    list.add(movie12);

    return list;
  }*/

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

    //hitMovieApi();
  }
  @override
  Widget build(BuildContext context) {
    //getAllMovies();
    // Main UI Thread
    hitMovieApi();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  Text(list[index].title),
                  Text(list[index].poster_path),
                ],
              ),
            );
          }
      ),
    );;
  }

  String API_URL = "https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=266dc584d6f6b3104259355c55cd06d8";
  void hitMovieApi() async {

    try {
      // hit api is running in a different thread
      Response response = await get(Uri.parse(API_URL));

      print("#### Response #### ${response.body.toString()}");

      if(response.statusCode == 200) {
        // Convert the data using factory -- Object
        var data = jsonDecode(response.body.toString());
        //var object = movieDataModelFromJson(data);
        // Update your ui

      } else  {
        print('#### ERROR ####');
      }
    } catch (e) {
      print('#### ERROR ####  ${e.toString()}');
    }

  }

  MovieData movieDataModelFromJson(Map<String, dynamic> json) =>
      MovieData.fromJson(json);
}