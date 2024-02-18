import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vmodel_blog_app/models/blogs_model.dart';
import 'package:vmodel_blog_app/service_locator.dart';
import 'package:vmodel_blog_app/services/network/network_request.dart';
import 'package:vmodel_blog_app/services/variables/request_variables.dart';

class BlogsRequests {
  getAllBlogs(BuildContext? context) async {
    QueryResult result =
        await APIRequest.get(context, {}, APIVariable.allBlogPosts, "");

    List<BlogsModel>? blogsModel;
    blogsModel = result.data!['allBlogPosts'].map<BlogsModel>((e) {
      return BlogsModel.fromJson(e);
    }).toList();

    $blogs.addBlogsList(blogsModel);
  }

  createBlogPost(context, String? title, subTitle, bodys) async {
    var body = {
      "title": title,
      "subTitle": subTitle,
      "body": bodys,
    };

    try {
      showLoading(context, message: "Creating Blog...");
      QueryResult result =
          await APIRequest.post(context, body, APIVariable.createBlogPost, "");

      if (result.hasException) {
        showSnackBar(context, "Something Went wrong", true);
      } else {
        getAllBlogs(context).then((e) {
          showSnackBar(context, "Blog Successfully created", false);
          Navigator.pop(context);
        });
      }
    } catch (error) {
      showSnackBar(context, "Something Went wrong", true);
    } finally {
      hideLoading(context);
    }
  }

  updateBlogPost(
      context, String? blogID, String? title, subTitle, bodys) async {
    var body = {
      "blogId": blogID,
      "title": title,
      "subTitle": subTitle,
      "body": bodys,
    };
    try {
      showLoading(context, message: "Updating Blog...");
      QueryResult result =
          await APIRequest.post(context, body, APIVariable.updateBlogPost, "");

      if (result.hasException) {
        showSnackBar(context, "Something Went wrong", true);
      } else {
        getAllBlogs(context).then((e) {
          showSnackBar(context, "Blog Successfully updated", false);

          Navigator.pop(context);
        });
      }
    } catch (error) {
      showSnackBar(context, "Something Went wrong", true);
    } finally {
      hideLoading(context);
    }
  }

  deleteBlogPost(context, blogID) async {
    try {
      showLoading(context, message: "Deleting Blog...");
      QueryResult result = await APIRequest.post(
          context, {"blogId": "$blogID"}, APIVariable.deleteBlogPost, "");
      if (result.hasException) {
        showSnackBar(context, "Something Went wrong", true);
      } else {
        getAllBlogs(context).then((e) {
          showSnackBar(context, "Blog Successfully deleted", false);
        });
      }
    } catch (error) {
      showSnackBar(context, "Something Went wrong", true);
    } finally {
      hideLoading(context);
    }
  }
}

void showLoading(context, {String? message}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Text(message ?? "Loading..."),
          ],
        ),
      );
    },
  );
}

void hideLoading(context) {
  Navigator.of(context).pop(); // Dismiss the dialog
}

void showSnackBar(context, String message, bool? isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      backgroundColor: isError == true ? Colors.red : const Color(0xff503C3C),
      content: Text(
        message,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
