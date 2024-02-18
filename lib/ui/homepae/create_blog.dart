import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/models/blogs_model.dart';
import 'package:vmodel_blog_app/services/blogs_services/blogs_requests.dart';
import 'package:vmodel_blog_app/ui/utilities/custom_textfield.dart';
import 'package:vmodel_blog_app/ui/utilities/homepage_header.dart';

class CreateBlog extends StatefulWidget {
  const CreateBlog({Key? key, required this.toEdit, this.blogsModel})
      : super(key: key);

  final bool? toEdit;
  final BlogsModel? blogsModel;

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String title = '';
  String subTitleString = '';
  String bodyy = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            HomepageHeader(
              title: widget.toEdit == true ? "Edit Blog..." : "Create Blog...",
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomTextField(
                    initialValue: widget.blogsModel?.title ?? "",
                    labelText: "Blog title",
                    onChanged: (e) {
                      setState(() {
                        title = e;
                      });
                    },
                  ),
                  CustomTextField(
                    initialValue: widget.blogsModel?.subTitle ?? "",
                    labelText: "Blog subtitle",
                    onChanged: (e) {
                      setState(() {
                        subTitleString = e;
                      });
                    },
                  ),
                  CustomTextField(
                    initialValue: widget.blogsModel?.body ?? "",
                    labelText: "Description",
                    maxLines: 6,
                    onChanged: (e) {
                      setState(() {
                        bodyy = e;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.height / 2, 55))),
                    onPressed: () async {
                    

                      if (title.isEmpty ||
                          subTitleString.isEmpty ||
                          bodyy.isEmpty) { 
                      } else {
                        widget.toEdit == true
                            ? await BlogsRequests().updateBlogPost(
                                context,
                                widget.blogsModel?.id,
                                title,
                                subTitleString,
                                bodyy)
                            : await BlogsRequests().createBlogPost(
                                context, title, subTitleString, bodyy);
                      }
                    },
                    child: Text(widget.toEdit == true ? "Edit post" : "Create Post"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
