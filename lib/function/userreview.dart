import 'package:flutter/material.dart';


class Userreview extends StatefulWidget {
    var revdetails;
    Userreview(this.revdetails);
  
    @override
    State<Userreview> createState() => _UserreviewState();
  }
  
  class _UserreviewState extends State<Userreview> {
    bool showall = false;
    @override
    Widget build(BuildContext context) {
      List ReviewDetails = widget.revdetails;
    if (ReviewDetails.length == 0) {
      return Center();
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'User Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState((){
                      showall = !showall;
                    });
                  },
                  child: Row(
                    children: [
                      showall == false?
                      Text(
                        'All Reviews' + '${ReviewDetails.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      )
                      :Text(
                        'Show Less',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                         fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
          showall == true?
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                     physics:  BouncingScrollPhysics(),
                      itemCount: ReviewDetails.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            right: 20,
                            bottom: 10,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(ReviewDetails[index]['avatarphoto']),
                                                fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                                child: Text(
                                                  ReviewDetails[index]['name'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:FontWeight.bold),
                                                ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              ReviewDetails[index]['creationdate'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                        children:[
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              ReviewDetails[index]['rating'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                    ))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                Expanded(
                                  child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.black87,
                                  child: Text(
                                    ReviewDetails[0]['review'],
                                    style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        );
                      }))
          : Container(
            child: Padding(
               padding: const EdgeInsets.only(
                top: 20,
                right: 20,
                bottom: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(ReviewDetails[0]['avatarphoto']),
                                    fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      ReviewDetails[0]['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                        ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ReviewDetails[0]['creationdate'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                ReviewDetails[0]['rating'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.black87,
                            child: Text(
                              ReviewDetails[0]['review'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
            )
          )
        ],
      );
    }
  }
}