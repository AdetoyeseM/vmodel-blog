import 'package:get_it/get_it.dart';
import 'package:vmodel_blog_app/services/blogs_services/blogs_bloc.dart';

GetIt locator = GetIt.instance;

closeAll(context) async {}

initializesingletons() {
  locator.registerLazySingleton(() => BLogsBLoc());
}

BLogsBLoc get $blogs => locator.get<BLogsBLoc>();
