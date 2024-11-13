class CategoryResponse {
  List<Categories>? categories;
  String? status;

  CategoryResponse({this.categories, this.status});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Categories {
  int? order;
  String? name;
  String? color;
  String? iconUrl;
  Null? events;
  String? id;
  bool? isDeleted;
  String? createAt;
  String? updateAt;

  Categories(
      {this.order,
        this.name,
        this.color,
        this.iconUrl,
        this.events,
        this.id,
        this.isDeleted,
        this.createAt,
        this.updateAt});

  Categories.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    name = json['name'];
    color = json['color'];
    iconUrl = json['iconUrl'];
    events = json['events'];
    id = json['id'];
    isDeleted = json['isDeleted'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['name'] = this.name;
    data['color'] = this.color;
    data['iconUrl'] = this.iconUrl;
    data['events'] = this.events;
    data['id'] = this.id;
    data['isDeleted'] = this.isDeleted;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}