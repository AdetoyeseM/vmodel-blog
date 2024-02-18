// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class APIRequest {
  String getErrorMessage(QueryResult response) {
    if (response.exception!.graphqlErrors.isNotEmpty) {
      return response.exception!.graphqlErrors[0].message;
    } else if (response.exception!.linkException != null) {
      return "An error occurred while communicating with the server. Please try again later.";
    } else {
      return "An unexpected error occurred. Please try again later.";
    }
  }

  static Future post(BuildContext? context, Map<String, dynamic> variables,
      String? document, message,
      {String? token}) async {
    HttpLink httpLink = HttpLink('https://uat-api.vmodel.app/graphql/',
        defaultHeaders: {"Authorization": "$token"});
    final QueryOptions options = QueryOptions(
      document: gql(document!),
      variables: variables,
    );

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    try {
      final QueryResult result = await client.query(options);

      if (result.hasException) {
        return result;
      } else {
        return result;
      }
    } catch (error) {
      return error;
    }
  }

  static Future get(BuildContext? context, Map<String, dynamic> variables,
      String? document, message,
      {String? token}) async {
    HttpLink httpLink = HttpLink('https://uat-api.vmodel.app/graphql/',
        defaultHeaders: {"Authorization": "$token"});

    final QueryOptions options = QueryOptions(
      document: gql(document!),
      variables: variables,
    );

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    try {
      final QueryResult result = await client.query(options);

      if (result.hasException) {
        return false;
      } else {
        return result;
      }
    } catch (error) {
      return false;
    }
  }
}
