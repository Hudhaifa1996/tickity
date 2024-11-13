class EventResponse {
  List<Data>? data;
  int? pageNumber;
  int? pageSize;
  int? totalCount;

  EventResponse({this.data, this.pageNumber, this.pageSize, this.totalCount});

  EventResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? startDate;
  String? bookingStartDate;
  bool? isDisabled;
  List<Images>? images;
  List<TicketTypes>? ticketTypes;

  Data(
      {this.id,
        this.title,
        this.startDate,
        this.bookingStartDate,
        this.isDisabled,
        this.images,
        this.ticketTypes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startDate = json['startDate'];
    bookingStartDate = json['bookingStartDate'];
    isDisabled = json['isDisabled'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['ticketTypes'] != null) {
      ticketTypes = <TicketTypes>[];
      json['ticketTypes'].forEach((v) {
        ticketTypes!.add(new TicketTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['startDate'] = this.startDate;
    data['bookingStartDate'] = this.bookingStartDate;
    data['isDisabled'] = this.isDisabled;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.ticketTypes != null) {
      data['ticketTypes'] = this.ticketTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? imageUrl;
  int? eventImageType;

  Images({this.imageUrl, this.eventImageType});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    eventImageType = json['eventImageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['eventImageType'] = this.eventImageType;
    return data;
  }
}

class TicketTypes {
  String? id;
  String? title;
  String? imageUrl;
  int? price;
  int? ticketsCount;
  int? availableTicketsCount;
  String? eventId;
  bool? isDisabled;

  TicketTypes(
      {this.id,
        this.title,
        this.imageUrl,
        this.price,
        this.ticketsCount,
        this.availableTicketsCount,
        this.eventId,
        this.isDisabled});

  TicketTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    ticketsCount = json['ticketsCount'];
    availableTicketsCount = json['availableTicketsCount'];
    eventId = json['eventId'];
    isDisabled = json['isDisabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['ticketsCount'] = this.ticketsCount;
    data['availableTicketsCount'] = this.availableTicketsCount;
    data['eventId'] = this.eventId;
    data['isDisabled'] = this.isDisabled;
    return data;
  }
}