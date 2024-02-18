import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/models/blogs_model.dart';
import 'package:vmodel_blog_app/services/blogs_services/blogs_requests.dart';
import 'package:vmodel_blog_app/ui/homepae/create_blog.dart';
import 'package:vmodel_blog_app/ui/homepae/detail_page.dart';
import 'package:vmodel_blog_app/ui/utilities/colors.dart';
import 'package:vmodel_blog_app/ui/utilities/dateformat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({Key? key, this.blogsModel}) : super(key: key);
  final BlogsModel? blogsModel;

  @override
  Widget build(BuildContext context) {
    Gradient gradient = generateRandomGradient();

    return Slidable(
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(8),
          onPressed: (e) async {
            await BlogsRequests().deleteBlogPost(context, blogsModel!.id!);
          },
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          spacing: 10,
          icon: Icons.delete,
          label: 'Delete',
        ),
        const SizedBox(
          width: 5,
        ),
        SlidableAction(
          borderRadius: BorderRadius.circular(8),
          spacing: 10,
          onPressed: (e) {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return CreateBlog(
                toEdit: true,
                blogsModel: blogsModel,
              );
            }));
          },
          foregroundColor: const Color(0xffDBD7D1),
          backgroundColor: const Color(0xff503C3C),
          icon: Icons.edit,
          label: 'Edit',
        ),
      ]),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (c) {
            return DetailPage(
              blogsModel: blogsModel!,
            );
          }));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 4),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(12, 12)),
                  gradient: gradient,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        blogsModel!.title!,
                        style: const TextStyle(
                            color: Color(0xff503C3C),
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        blogsModel!.subTitle!,
                        softWrap: true,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.access_time,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            formatDate(
                              blogsModel!.dateCreated!,
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
