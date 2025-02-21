class Post {
  String? id;
  int? uid;
  String? name;
  String? slug;
  int? display;
  int? parent;
  int? menuOrder;
  String? bannerImage;
  String? image;
  String? permalink;
  String? parentName;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Post({
    this.id,
    this.uid,
    this.name,
    this.slug,
    this.display,
    this.parent,
    this.menuOrder,
    this.bannerImage,
    this.image,
    this.permalink,
    this.parentName,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to convert JSON to a Dart object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      uid: json['uid'],
      name: json['name'],
      slug: json['slug'],
      display: json['display'],
      parent: json['parent'],
      menuOrder: json['menu_order'],
      bannerImage: json['bannerImage'] ?? "",
      image: json['image'],
      permalink: json['permalink'],
      parentName: json['parent_name'], // Nullable
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
