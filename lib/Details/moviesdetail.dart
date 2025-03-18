// import 'package:flutter/material.dart';
// import '../HomePage/home.dart';
// import '../data/app_constant.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../function/slider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../function/trailer.dart';
// import '../function/userreview.dart';


// class Moviesdetail extends StatefulWidget {
//   var id;
//   Moviesdetail(this.id);

//   @override
//   State<Moviesdetail> createState() => _MoviesdetailState();
// }

// class _MoviesdetailState extends State<Moviesdetail> {
//   List<Map<String,dynamic>> Moviesdetail = [];
//   List<Map<String,dynamic>> UserReview = [];
//   List<Map<String,dynamic>> Similarmovieslist = [];
//   List<Map<String,dynamic>> Recommendedmovieslist = [];
//   List<Map<String,dynamic>> Movietrailerslist = [];
  
//   List Moviesgenres = [];

//   Future<void>Moviedetail() async {
//     var moviedetailurl = 
//         'https://api.themoviedb.org/3/movie/' + widget.id.toString() + '?api_key=$apikey';

//     var userreviewurl = 
//         'https://api.themoviedb.org/3/movie/' + widget.id.toString() + '/reviews?api_key=$apikey';

//     var similarmoviesurl = 
//         'https://api.themoviedb.org/3/movie/' + widget.id.toString() + '/similar?api_key=$apikey';

//     var recommendedmoviesurl = 
//         'https://api.themoviedb.org/3/movie/' + widget.id.toString() + '/recommendations?api_key=$apikey';

//     var movietrailersurl = 
//         'https://api.themoviedb.org/3/movie/' + widget.id.toString() + '/videos?api_key=$apikey';


//     var moviedetailresponse = await http.get(Uri.parse(moviedetailurl));
//     if (moviedetailresponse.statusCode == 200) {
//       var moviedetailjson = jsonDecode(moviedetailresponse.body);
//       for (var i = 0; i < 1; i++) {
//         Moviesdetail.add({
//           "backdrop_path": moviedetailjson[i]["backdrop_path"],
//           "title": moviedetailjson[i]["title"],
//           "vote_average": moviedetailjson[i]["vote_average"],
//           "overview": moviedetailjson[i]["overview"],
//           "release_date": moviedetailjson[i]["release_date"],
//           "runtime": moviedetailjson[i]["runtime"],
//           "budget": moviedetailjson[i]["budget"],
//           "revenue": moviedetailjson[i]["revenue"],
//         });
//       }
//       for(var i = 0; i < moviedetailjson['genres'].length; i++) {
//         Moviesgenres.add(moviedetailjson['genres'][i]['name']);
//       }
//     } else {
//       print(moviedetailresponse.statusCode);
//     }

//     var userreviewresponse = await http.get(Uri.parse(userreviewurl));
//     if (userreviewresponse.statusCode == 200) {
//       var userreviewjson = jsonDecode(userreviewresponse.body);
//       for (var i = 0; i < userreviewjson['results'].length; i++) {
//         UserReview.add({
//           "name": userreviewjson['results'][i]["author"],
//           "review": userreviewjson['results'][i]["content"],
//           "rating": userreviewjson['results'][i]["author_details"]["rating"] == null? 
//           "Not Rated": userreviewjson['results'][i]["author_details"]["rating"].toString(),
//           "avatarphoto": userreviewjson['results'][i]['author_details']['avatar_path'] == null
//               ? "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"
//               : "https://image.tmdb.org/t/p/w500" +
//                   userreviewjson['results'][i]['author_details']['avatar_path'],
//           "creationdate": userreviewjson['results'][i]['created_at'].substring(0, 10),
//           "fullreviewurl": userreviewjson['results'][i]['url'],
//         });
//       }
//     } else {
//       print(userreviewresponse.statusCode);
//     }

//     var similarmoviesresponse = await http.get(Uri.parse(similarmoviesurl));
//     if (similarmoviesresponse.statusCode == 200) {
//       var similarmoviesjson = jsonDecode(similarmoviesresponse.body);
//       for (var i = 0; i < similarmoviesjson['results'].length; i++) {
//         Similarmovieslist.add({
//           "poster_path": similarmoviesjson['results'][i]['poster_path'],
//           "name": similarmoviesjson['results'][i]['title'],
//           "vote_average": similarmoviesjson['results'][i]['vote_average'],
//           "Date": similarmoviesjson['results'][i]['release_date'],
//           "id": similarmoviesjson['results'][i]['id'],
//         });
//       }
//     } else {}
//     // print(similarmovieslist);

//     var recommendedmoviesresponse =
//         await http.get(Uri.parse(recommendedmoviesurl));
//     if (recommendedmoviesresponse.statusCode == 200) {
//       var recommendedmoviesjson = jsonDecode(recommendedmoviesresponse.body);
//       for (var i = 0; i < recommendedmoviesjson['results'].length; i++) {
//         Recommendedmovieslist.add({
//           "poster_path": recommendedmoviesjson['results'][i]['poster_path'],
//           "name": recommendedmoviesjson['results'][i]['title'],
//           "vote_average": recommendedmoviesjson['results'][i]['vote_average'],
//           "Date": recommendedmoviesjson['results'][i]['release_date'],
//           "id": recommendedmoviesjson['results'][i]['id'],
//         });
//       }
//     } else {}
//     // print(recommendedmovieslist);

//     var movietrailersresponse = await http.get(Uri.parse(movietrailersurl));
//     if (movietrailersresponse.statusCode == 200) {
//       var movietrailersjson = jsonDecode(movietrailersresponse.body);
//       for (var i = 0; i < movietrailersjson['results'].length; i++) {
//         if (movietrailersjson['results'][i]['type'] == "Trailer") {
//           Movietrailerslist.add({
//             "key": movietrailersjson['results'][i]['key'],
//           });
//         }
//       }
//       Movietrailerslist.add({'key': 'aJ0cZTcTh90'});
//     } else {}
//     print(Movietrailerslist);


//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(14, 14, 14, 1),
//       body: FutureBuilder(
//         future: Moviedetail(),
//           builder: (context, snapshot){
//             if (snapshot.connectionState == ConnectionState.done){
//               return CustomScrollView(
//                 physics: BouncingScrollPhysics(),
//                 slivers: [
//                   SliverAppBar(
//                     automaticallyImplyLeading: false,
//                     leading: IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(FontAwesomeIcons.circleArrowLeft),
//                       iconSize: 28,
//                       color: Colors.white),
//                   actions: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                         builder: (context) => HomePage()),
//                        (route) => false);
//                            },
//                           icon: Icon(FontAwesomeIcons.houseUser),
//                           iconSize: 25,
//                          color: Colors.white),
//                     ],
//                     backgroundColor: Color.fromRGBO(18, 18, 18, 0.5),
//                     centerTitle: false,
//                     pinned: true,
//                     expandedHeight:
//                         MediaQuery.of(context).size.height * 0.4,
//                     flexibleSpace: FlexibleSpaceBar(
//                       collapseMode: CollapseMode.parallax,
//                        background: FittedBox(
//                          fit: BoxFit.fill,
//                          child: Trailerwatch(
//                           Movietrailerslist[0]['key'],
//                             ),
//                           ),
//                         )),
//                   SliverList(
//                     delegate: SliverChildListDelegate([
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(left: 10, top: 10),
//                             height: 50,
//                             width: MediaQuery.of(context).size.width,
//                             child: ListView.builder(
//                               physics: BouncingScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: Moviesgenres.length,
//                               itemBuilder: (context, index){
//                                 return Container(
//                                   margin: EdgeInsets.only(right: 10),
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     color:Color.fromRGBO(25, 25, 25, 1),
//                                     borderRadius: BorderRadius.circular(10)),
//                                     child: Text(Moviesgenres[index]));

//                               })),
//                           ]),
//                           Row(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 margin: EdgeInsets.only(left: 10, top: 10),
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   color: Color.fromRGBO(25, 25, 25, 1),
//                                   borderRadius: BorderRadius.circular(10)),
//                                   child: Text(
//                                     Moviesdetail[0]['runtime'].toString() + 'min'))
//                             ],
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20, top: 10),
//                           child: Text('Movie Story :')
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20, top: 10),
//                           child: Text(Moviesdetail[0]['overview'].toString())
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20, top: 10),
//                           child: Userreview(UserReview)
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20, top: 10),
//                           child: Text('Release Date :' + Moviesdetail[0]['release_date'].toString())
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20, top: 10),
//                           child: Text('Budget :' + Moviesdetail[0]['budget'].toString())
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 20, top: 10),
//                           child: Text('Revenue :' + Moviesdetail[0]['revenue'].toString())
//                       ),
//                       sliderlist(Similarmovieslist, "Similar Movies", "movie",
//                           Similarmovieslist.length),
//                       sliderlist(Recommendedmovieslist, "Recommended Movies", "movie",
//                           Recommendedmovieslist.length),
//                       // Container(
//                       //     height: 50,
//                       //     child: Center(child: normaltext("Coding")))
//                     ]))
//                 ]);
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.amber,
//                 ));
//             }
//           }),
//     );
//   }
// }












import 'package:flutter/material.dart';
import '../HomePage/home.dart';
import '../data/app_constant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../function/slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../function/trailer.dart';
import '../function/userreview.dart';

class Moviesdetail extends StatefulWidget {
  final int id;
  Moviesdetail(this.id);

  @override
  State<Moviesdetail> createState() => _MoviesdetailState();
}

class _MoviesdetailState extends State<Moviesdetail> {
  List<Map<String, dynamic>> Moviesdetail = [];
  List<Map<String, dynamic>> UserReview = [];
  List<Map<String, dynamic>> Similarmovieslist = [];
  List<Map<String, dynamic>> Recommendedmovieslist = [];
  List<Map<String, dynamic>> Movietrailerslist = [];
  List<String> Moviesgenres = [];

  Future<void> fetchMovieDetails() async {
    Moviesdetail.clear();
    Moviesgenres.clear();
    Movietrailerslist.clear();
    UserReview.clear();
    Similarmovieslist.clear();
    Recommendedmovieslist.clear();

    try {
      final moviedetailurl =
          'https://api.themoviedb.org/3/movie/${widget.id}?api_key=$apikey';
      final userreviewurl =
          'https://api.themoviedb.org/3/movie/${widget.id}/reviews?api_key=$apikey';
      final similarmoviesurl =
          'https://api.themoviedb.org/3/movie/${widget.id}/similar?api_key=$apikey';
      final recommendedmoviesurl =
          'https://api.themoviedb.org/3/movie/${widget.id}/recommendations?api_key=$apikey';
      final movietrailersurl =
          'https://api.themoviedb.org/3/movie/${widget.id}/videos?api_key=$apikey';

      var moviedetailresponse = await http.get(Uri.parse(moviedetailurl));
      if (moviedetailresponse.statusCode == 200) {
        var moviedetailjson = jsonDecode(moviedetailresponse.body);
        Moviesdetail.add({
          "backdrop_path": moviedetailjson["backdrop_path"],
          "title": moviedetailjson["title"],
          "vote_average": moviedetailjson["vote_average"],
          "overview": moviedetailjson["overview"],
          "release_date": moviedetailjson["release_date"],
          "runtime": moviedetailjson["runtime"],
          "budget": moviedetailjson["budget"],
          "revenue": moviedetailjson["revenue"],
        });
        Moviesgenres = List<String>.from(moviedetailjson['genres'].map((g) => g['name']));
      }

      var userreviewresponse = await http.get(Uri.parse(userreviewurl));
      if (userreviewresponse.statusCode == 200) {
        var userreviewjson = jsonDecode(userreviewresponse.body);
        UserReview = List<Map<String, dynamic>>.from(
          userreviewjson['results'].map((r) => {
            "name": r["author"],
            "review": r["content"],
            "rating": r["author_details"]["rating"]?.toString() ?? "Not Rated",
            "avatarphoto": r['author_details']['avatar_path'] != null
                ? "https://image.tmdb.org/t/p/w500" + r['author_details']['avatar_path']
                : "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
            "creationdate": r['created_at'].substring(0, 10),
            "fullreviewurl": r['url'],
          }),
        );
      }

      var movietrailersresponse = await http.get(Uri.parse(movietrailersurl));
      if (movietrailersresponse.statusCode == 200) {
        var movietrailersjson = jsonDecode(movietrailersresponse.body);
        Movietrailerslist = List<Map<String, dynamic>>.from(
          movietrailersjson['results'].where((t) => t['type'] == "Trailer").map((t) => {"key": t['key']}),
        );
      }

      setState(() {});
    } catch (e) {
      print("Error fetching movie details: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 14, 14, 1),
      body: Moviesdetail.isEmpty
          ? Center(child: CircularProgressIndicator(color: Colors.amber))
          : CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(FontAwesomeIcons.circleArrowLeft),
                      color: Colors.white),
                  actions: [
                    IconButton(
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false),
                        icon: Icon(FontAwesomeIcons.houseUser),
                        color: Colors.white),
                  ],
                  backgroundColor: Color.fromRGBO(18, 18, 18, 0.5),
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Movietrailerslist.isNotEmpty
                        ? Trailerwatch(Movietrailerslist[0]['key'])
                        : SizedBox(),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        color: Colors.black87,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          Moviesdetail[0]['overview'] ?? "No Overview Available",
                          style: TextStyle(color: Colors.white),
                          ),
                        ),
                      Container(
                        color: Colors.black54,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Release Date: ${Moviesdetail[0]['release_date'] ?? "N/A"}',
                          style: TextStyle(color: Colors.white),
                          ),
                        ),
                      Container(
                        color: Colors.black26,
                        padding: EdgeInsets.all(10),
                        child: Userreview(UserReview),
                      ),
                    ]),
                  )
              ],
            ),
    );
  }
}
