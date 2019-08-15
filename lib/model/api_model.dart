class BlogCategory {
  List<Results> results;

  BlogCategory({this.results});

  BlogCategory.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int id;
  List<Blogs> blogs;
  String categoryName;
  String categoryImage;
  String slug;
  String created;
  String updated;

  Results(
      {this.id,
      this.blogs,
      this.categoryName,
      this.categoryImage,
      this.slug,
      this.created,
      this.updated});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['blogs'] != null) {
      blogs = new List<Blogs>();
      json['blogs'].forEach((v) {
        blogs.add(new Blogs.fromJson(v));
      });
    }
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    slug = json['slug'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.blogs != null) {
      data['blogs'] = this.blogs.map((v) => v.toJson()).toList();
    }
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['slug'] = this.slug;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class Blogs {
  int id;
  String title;
  String article;
  String blogImage;
  String created;
  String updated;
  int category;
  int owner;

  Blogs(
      {this.id,
      this.title,
      this.article,
      this.blogImage,
      this.created,
      this.updated,
      this.category,
      this.owner});

  Blogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    article = json['article'];
    blogImage = json['blog_image'];
    created = json['created'];
    updated = json['updated'];
    category = json['category'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['article'] = this.article;
    data['blog_image'] = this.blogImage;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['category'] = this.category;
    data['owner'] = this.owner;
    return data;
  }
}