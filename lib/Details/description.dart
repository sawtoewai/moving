// import 'package:flutter/material.dart';
// import 'package:moving/Details/moviesdetail.dart';
// import 'package:moving/Details/tvseriesdetail.dart';


// class Description extends StatefulWidget {
//   var newid;
//   var newtype;

//   Description(this.newid, this.newtype);

//   @override
//   State<Description> createState() => _DescriptionState();
// }

// class _DescriptionState extends State<Description> {
//   checktype(){
//     if(widget.newtype == 'movie'){
//       return Moviesdetail(widget.newid);
//     }
//     else if(widget.newtype == 'tv'){
//       return TvSeriesDetails(widget.newid);
//     }
//     else{
//       return errorui();
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return checktype();
//   }
// }

// Widget errorui(){
//   return Scaffold(
//     body: Center(
//       child: Text("Error"),
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:moving/Details/moviesdetail.dart';
import 'package:moving/Details/tvseriesdetail.dart';

class Description extends StatefulWidget {
  final int newid;
  final String newtype;

  const Description(this.newid, this.newtype, {Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  Widget checktype() {
    if (widget.newtype == 'movie') {
      return Moviesdetail(widget.newid); // Ensure constructor matches
    } else if (widget.newtype == 'tv') {
      return TvSeriesDetails(id: widget.newid);
    } else {
      return errorui();
    }
  }

  @override
  Widget build(BuildContext context) {
    return checktype();
  }
}

Widget errorui() {
  return Scaffold(
    body: Center(
      child: Text("Error"),
    ),
  );
}
