import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../data/app_constant.dart';
import '../function/slider.dart';

class Upcomming extends StatefulWidget {
  const Upcomming({super.key});

  @override
  State<Upcomming> createState() => _UpcommingState();
}

class _UpcommingState extends State<Upcomming> {
  Future<List<Map<String, dynamic>>> upcomminglist() async {
    try {
      var url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var tempdata = jsonDecode(response.body);
        print("API Response: $tempdata"); // Debugging

        if (tempdata.containsKey('results') && tempdata['results'] is List) {
          return List<Map<String, dynamic>>.from(
            tempdata['results'].map((movie) => {
              "name": movie["title"] ?? "Unknown",
              "poster_path": movie["poster_path"] ?? "",
              "vote_average": movie["vote_average"] ?? 0.0,
              "Date": movie["release_date"] ?? "Unknown",
              "id": movie["id"] ?? 0,
            })
          );
        }
      } else {
        print("Error fetching movies: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: upcomminglist(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No upcoming movies found."));
        } else {
          var upcommingmovies = snapshot.data!;

          if (upcommingmovies.isEmpty) {
            return const Center(child: Text("No movies available."));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sliderlist(upcommingmovies, "Upcoming", "movie", 20),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 40),
                child: Text("Many More Coming Soon..."),
              ),
            ],
          );
        }
      },
    );
  }
}