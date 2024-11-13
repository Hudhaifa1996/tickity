class CollectionResponse {
  List<Collections>? collections;
  String? status;

  CollectionResponse({this.collections, this.status});

  CollectionResponse.fromJson(Map<String, dynamic> json) {
    if (json['collections'] != null) {
      collections = <Collections>[];
      json['collections'].forEach((v) {
        collections!.add(new Collections.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collections != null) {
      data['collections'] = this.collections!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Collections {
  String? name;
  int? collectionType;
  int? order;
  String? id;
  bool? isDeleted;
  String? createAt;
  String? updateAt;

  Collections(
      {this.name,
        this.collectionType,
        this.order,
        this.id,
        this.isDeleted,
        this.createAt,
        this.updateAt});

  Collections.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    collectionType = json['collectionType'];
    order = json['order'];
    id = json['id'];
    isDeleted = json['isDeleted'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['collectionType'] = this.collectionType;
    data['order'] = this.order;
    data['id'] = this.id;
    data['isDeleted'] = this.isDeleted;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}