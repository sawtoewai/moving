// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../Details/description.dart';
// import '../data/app_constant.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class Searchbarfunc extends StatefulWidget {
//   const Searchbarfunc({super.key});

//   @override
//   State<Searchbarfunc> createState() => _SearchbarfuncState();
// }

// class _SearchbarfuncState extends State<Searchbarfunc> {
//   List<Map<String, dynamic>> searchresult = [];
//   final TextEditingController searchtext = TextEditingController();
//   bool showlist = false;
//   var val1;

//   Future<void> searchlistfunction(String val) async {
//     var searchurl = 
//         'https://api.themoviedb.org/3/search/multi?api_key=$apikey&query=$val';
//     var searchresponse = await http.get(Uri.parse(searchurl));
//     if (searchresponse.statusCode == 200) {
//       var tempdata = jsonDecode(searchresponse.body);
//       var searchjson = tempdata['results'];
//       for (var item in searchjson) {
//         if (item['id'] != null &&
//             item['poster_path'] != null &&
//             item['vote_average'] != null &&
//             item['media_type'] != null){
//           searchresult.add({
//             'id': item['id'],
//             'poster_path': item['poster_path'],
//             'vote_average': item['vote_average'],
//             'media_type': item['media_type'],
//             'popularity': item['popularity'],
//             'overview': item['overview'],
//           });
//           if (searchresult.length > 20) {
//             searchresult.removeRange(20, searchresult.length);
//           }
//         } else {
//           print('null value found');
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // print("tapped");
//         FocusManager.instance.primaryFocus?.unfocus();
//         showlist = !showlist;
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10.0, top: 30, bottom: 20, right: 10),
//         child: Column(
//           children: [
//             Container(
//               height: 50,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.all(Radius.circular(10))
//               ),
//               child: TextField(
//                 autofocus: false,
//                 controller: searchtext,
//                 onSubmitted: (value){
//                     searchresult.clear();
//                     setState(() {
//                       val1 = value;
//                       FocusManager.instance.primaryFocus?.unfocus();
//                     });
//                   },
//                   onChanged: (value) {
//                     searchresult.clear();
//                     setState(() {
//                       val1 = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                           Fluttertoast.showToast(
//                             webBgColor: "#000000",
//                             webPosition: "center",
//                             webShowClose: true,
//                             msg: "Search Cleared",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 2,
//                             backgroundColor: Color.fromRGBO(18, 18, 18, 1),
//                             textColor: Colors.white,
//                             fontSize: 16.0);

//                           setState(() {
//                             searchtext.clear();
//                             FocusManager.instance.primaryFocus?.unfocus();
//                           });
//                         },
//                         icon: Icon(
//                           Icons.arrow_back_ios_rounded,
//                           color: Colors.amber.withOpacity(0.6),
//                         ),
//                       ),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: Colors.amber,
//                       ),
//                       hintText: 'Search',
//                       hintStyle:
//                           TextStyle(color: Colors.amber.withOpacity(0.2)),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 if(searchtext.text.length > 0)
//                 FutureBuilder(
//                   future: searchlistfunction(val1),
//                   builder: (context, snapshot){
//                     if (snapshot.connectionState == ConnectionState.done){
//                       return Container(
//                         height: 400,
//                         child: ListView.builder(
//                           itemCount: searchresult.length,
//                           scrollDirection: Axis.vertical,
//                           physics: BouncingScrollPhysics(),
//                           itemBuilder: (context, index){
//                             return GestureDetector(
//                                onTap: () {
//                                 Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                 builder: (context) =>
//                                 Description(
//                                 searchresult[index]['id'],searchresult[index]['media_type'],
//                                  )));
//                                 },
//                               child: Container(
//                                 margin: EdgeInsets.only(top: 4, bottom: 4),
//                                 height: 180,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                   color: Color.fromRGBO(20, 20, 20, 1),
//                                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *0.4,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                             'https://image.tmdb.org/t/p/w500${searchresult[index]['poster_path']}'),
//                                           fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(width: 20),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 alignment: Alignment.topCenter,
//                                                 child: Text(
//                                                   '${searchresult[index]['media_type']}',
//                                                 ),
//                                               ),
//                                               Container(
//                                                 child: Row(
//                                                   children: [
//                                                     Container(
//                                                       padding: EdgeInsets.all(5),
//                                                       height: 30,
//                                                       // width:
//                                                       //     100,
//                                                       decoration: BoxDecoration(
//                                                         color: Colors.amber.withOpacity(0.2),
//                                                         borderRadius: BorderRadius.all(Radius.circular(6)),
//                                                       ),
//                                                       child: Center(
//                                                         child: Row(
//                                                            mainAxisAlignment: MainAxisAlignment.center,
//                                                           children: [
//                                                               Icon(
//                                                                 Icons.star,color: Colors.amber,size:20,
//                                                               ),
//                                                               SizedBox(width: 5),
//                                                               Text(
//                                                                 '${searchresult[index]['vote_average']}'
//                                                               ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: 10),
//                                                     Container(
//                                                       padding:
//                                                         EdgeInsets.all(5),
//                                                         height: 30,
//                                                         decoration: BoxDecoration(
//                                                           color: Colors.amber.withOpacity(0.2),
//                                                           borderRadius:
//                                                           BorderRadius.all(Radius.circular(8)),
//                                                         ),
//                                                         child: Row(
//                                                           mainAxisAlignment:MainAxisAlignment.center,
//                                                           children: [
//                                                             Icon(
//                                                               Icons.people_outline_sharp,
//                                                                 color: Colors.amber,
//                                                                 size:10,
//                                                             ),
//                                                             SizedBox(width: 5),
//                                                             Expanded(
//                                                               child: FittedBox(
//                                                                 fit: BoxFit.scaleDown,
//                                                               child: Text(
//                                                                 '${searchresult[index]['popularity']}',
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 maxLines: 1,
//                                                                 style: TextStyle(
//                                                                   fontSize: 12),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               Container(
//                                                 width: MediaQuery.of(context).size.width * 0.4,
//                                                 height: 85,
//                                                 child: Text(
//                                                   '${searchresult[index]['overview']}',
//                                                   style: TextStyle(
//                                                     fontSize:12,
//                                                     color: Colors.white
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     } else {
//                       return Center(
//                         child: CircularProgressIndicator(
//                             color: Colors.amber,
//                           ));
//                     }
//                   },
//                 )
//           ],
//         ),
//       ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Details/description.dart';
import '../data/app_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchBarFunc extends StatefulWidget {
  const SearchBarFunc({super.key});

  @override
  State<SearchBarFunc> createState() => _SearchBarFuncState();
}

class _SearchBarFuncState extends State<SearchBarFunc> {
  List<Map<String, dynamic>> searchResults = [];
  final TextEditingController searchController = TextEditingController();
  bool showList = false;
  String? searchQuery;

  Future<void> searchListFunction(String query) async {
    if (query.isEmpty) return;
    
    final searchUrl = 'https://api.themoviedb.org/3/search/multi?api_key=$apikey&query=$query';
    final response = await http.get(Uri.parse(searchUrl));

    if (response.statusCode == 200) {
      final tempData = jsonDecode(response.body);
      final searchJson = tempData['results'] as List<dynamic>?;

      if (searchJson != null) {
        setState(() {
          searchResults = searchJson.where((item) =>
            item['id'] != null &&
            item['poster_path'] != null &&
            item['vote_average'] != null &&
            item['media_type'] != null
          ).map((item) => {
            'id': item['id'],
            'poster_path': item['poster_path'],
            'vote_average': item['vote_average'],
            'media_type': item['media_type'],
            'popularity': item['popularity'],
            'overview': item['overview'],
          }).take(20).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                onSubmitted: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                  searchListFunction(value);
                },
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Search Cleared",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      setState(() {
                        searchController.clear();
                        searchResults.clear();
                        searchQuery = null;
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.amber.withOpacity(0.6)),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.amber),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.amber.withOpacity(0.2)),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 5),
            if (searchQuery != null && searchQuery!.isNotEmpty)
              searchResults.isNotEmpty
                ? SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: searchResults.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = searchResults[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(item['id'], item['media_type']),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            height: 180,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(20, 20, 20, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage('https://image.tmdb.org/t/p/w500${item['poster_path']}'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${item['media_type']}', style: TextStyle(color: Colors.white)),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.amber.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                                  const SizedBox(width: 5),
                                                  Text('${item['vote_average']}'),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.amber.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.people_outline_sharp, color: Colors.amber, size: 10),
                                                  const SizedBox(width: 5),
                                                  Text('${item['popularity']}'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          height: 85,
                                          child: Text('${item['overview']}',
                                            style: const TextStyle(fontSize: 12, color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator(color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}