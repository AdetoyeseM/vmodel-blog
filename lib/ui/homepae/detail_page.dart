import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/models/blogs_model.dart';
import 'package:vmodel_blog_app/services/blogs_services/blogs_requests.dart';
import 'package:vmodel_blog_app/ui/utilities/dateformat.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.blogsModel});
  final BlogsModel? blogsModel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: height / 2.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1498758536662-35b82cd15e29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 48, left: 16),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 2.6),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Container(
                margin: EdgeInsets.only(top: height / 20),
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        blogsModel!.title!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff503C3C),
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      //Title
                      Text(
                        blogsModel!.subTitle!,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      //like and duration
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            formatDate(blogsModel!.dateCreated!),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        blogsModel!.body!,
                        softWrap: true,
                        style: const TextStyle(
                            // overflow: TextOverflow.ellipsis,
                            color: Colors.black54,
                            fontSize: 16.5,
                            height: 1.4),
                        textAlign: TextAlign.left,
                        maxLines: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
