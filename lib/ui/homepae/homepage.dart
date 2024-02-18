import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmodel_blog_app/models/blogs_model.dart';
import 'package:vmodel_blog_app/service_locator.dart';
import 'package:vmodel_blog_app/services/blogs_services/blogs_requests.dart';
import 'package:vmodel_blog_app/ui/homepae/create_blog.dart';
import 'package:vmodel_blog_app/ui/utilities/blog_tile.dart';
import 'package:vmodel_blog_app/ui/utilities/homepage_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';

  @override
  void initState() {
    BlogsRequests().getAllBlogs(context);
    super.initState();
  }

  TextEditingController? searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const CreateBlog(
                toEdit: false,
              );
            }));
          },
          label: const Text("Create Blog post"),
          icon: const Icon(Icons.add)),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const HomepageHeader(),
              SizedBox(
                height: 58,
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Search for blogs...',
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            searchController?.clear();
                            _searchQuery = '';
                          });
                        },
                        child: const Icon(Icons.close)),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                  alignment: Alignment.topRight,
                  child: Text("Swipe Card left to Edit or Delete")),
              StreamBuilder<List<BlogsModel>>(
                stream: $blogs.allBlogsModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  }

                  while (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 120,
                          ),
                          Icon(
                            Icons.hourglass_empty_outlined,
                            size: 54,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "All added Blogs appears here",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    );
                  }
                  List<BlogsModel> filteredBlogs = snapshot.data ?? [];
                  if (_searchQuery.isNotEmpty) {
                    filteredBlogs = filteredBlogs
                        .where((blog) =>
                            blog.title!
                                .toLowerCase()
                                .contains(_searchQuery.toLowerCase()) ||
                            blog.subTitle!
                                .toLowerCase()
                                .contains(_searchQuery.toLowerCase()))
                        .toList();
                  }
                  filteredBlogs
                      .sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));

                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        return BlogsRequests().getAllBlogs(context);
                      },
                      child: ListView.separated(
                        separatorBuilder: (e, r) {
                          return const Divider();
                        },
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        itemCount: filteredBlogs.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            blogsModel: filteredBlogs[index],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
