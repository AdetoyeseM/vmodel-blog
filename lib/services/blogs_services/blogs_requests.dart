import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vmodel_blog_app/models/blogs_model.dart';
import 'package:vmodel_blog_app/service_locator.dart';
import 'package:vmodel_blog_app/services/network/network_request.dart';
import 'package:vmodel_blog_app/services/variables/request_variables.dart';
import 'package:vmodel_blog_app/ui/utilities/alert_dialog.dart';

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
      AlertDialogWidget.showLoading(context, message: "Creating Blog...");
      QueryResult result =
          await APIRequest.post(context, body, APIVariable.createBlogPost, "");

      if (result.hasException) {
        AlertDialogWidget.showSnackBar(context, "Something Went wrong", true);
      } else {
        getAllBlogs(context).then((e) {
          AlertDialogWidget.showSnackBar(
              context, "Blog Successfully created", false);
          Navigator.pop(context);
        });
      }
    } catch (error) {
      AlertDialogWidget.showSnackBar(context, "Something Went wrong", true);
    } finally {
      AlertDialogWidget.hideLoading(context);
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
      AlertDialogWidget.showLoading(context, message: "Updating Blog...");
      QueryResult result =
          await APIRequest.post(context, body, APIVariable.updateBlogPost, "");

      if (result.hasException) {
        AlertDialogWidget.showSnackBar(context, "Something Went wrong", true);
      } else {
        getAllBlogs(context).then((e) {
          AlertDialogWidget.showSnackBar(
              context, "Blog Successfully updated", false);

          Navigator.pop(context);
        });
      }
    } catch (error) {
      AlertDialogWidget.showSnackBar(context, "Something Went wrong", true);
    } finally {
      AlertDialogWidget.hideLoading(context);
    }
  }

  deleteBlogPost(context, blogID) async {
    try {
      AlertDialogWidget.showLoading(context, message: "Deleting Blog...");
      QueryResult result = await APIRequest.post(
          context, {"blogId": "$blogID"}, APIVariable.deleteBlogPost, "");
      if (result.hasException) {
        AlertDialogWidget.showSnackBar(context, "Something Went wrong", true);
      } else {
        getAllBlogs(context).then((e) {
          AlertDialogWidget.showSnackBar(
              context, "Blog Successfully deleted", false);
        });
      }
    } catch (error) {
      AlertDialogWidget.showSnackBar(context, "Something Went wrong", true);
    } finally {
      AlertDialogWidget.hideLoading(context);
    }
  }
}
