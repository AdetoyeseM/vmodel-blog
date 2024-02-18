class APIVariable {
  static String allBlogPosts = """query fetchAllBlogs {
  allBlogPosts {
    id
    title
    subTitle
    body
    dateCreated
  }
}""";

  static String createBlogPost =
      """mutation createBlogPost(\$title: String!, \$subTitle: String!, \$body: String!) {
  createBlog(title: \$title, subTitle: \$subTitle, body: \$body) {
    success
    blogPost {
      id
      title
      subTitle
      body
      dateCreated
    }
  }
}""";

  static String deleteBlogPost = """mutation deleteBlogPost(\$blogId: String!) {
  deleteBlog(blogId: \$blogId) {
    success
  }
}
""";

  static String updateBlogPost = """mutation updateBlogPost(\$blogId: String!, \$title: String!, \$subTitle: String!, \$body: String!) {
  updateBlog(blogId: \$blogId, title: \$title, subTitle: \$subTitle, body: \$body) {
    success
    blogPost {
      id
      title
      subTitle
      body
      dateCreated
    }
  }
}""";
}
