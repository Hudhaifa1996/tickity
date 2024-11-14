class EventResponse {
  EventResponse({
    required this.data,
    required this.pageNumber,
    required this.pageSize,
    required this.totalCount,
  });

  final List<Datum> data;
  final int? pageNumber;
  final int? pageSize;
  final int? totalCount;

  factory EventResponse.fromJson(Map<String, dynamic> json){
    return EventResponse(
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      pageNumber: json["pageNumber"],
      pageSize: json["pageSize"],
      totalCount: json["totalCount"],
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.startDate,
    required this.bookingStartDate,
    required this.isDisabled,
    required this.images,
    required this.ticketTypes,
  });

  final String? id;
  final String? title;
  final DateTime? startDate;
  final DateTime? bookingStartDate;
  final bool? isDisabled;
  final List<Image> images;
  final List<TicketType> ticketTypes;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      title: json["title"],
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      bookingStartDate: DateTime.tryParse(json["bookingStartDate"] ?? ""),
      isDisabled: json["isDisabled"],
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      ticketTypes: json["ticketTypes"] == null ? [] : List<TicketType>.from(json["ticketTypes"]!.map((x) => TicketType.fromJson(x))),
    );
  }

}

class Image {
  Image({
    required this.imageUrl,
    required this.eventImageType,
  });

  final String? imageUrl;
  final int? eventImageType;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      imageUrl: json["imageUrl"],
      eventImageType: json["eventImageType"],
    );
  }

}

class TicketType {
  TicketType({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.ticketsCount,
    required this.availableTicketsCount,
    required this.eventId,
    required this.isDisabled,
  });

  final String? id;
  final String? title;
  final String? imageUrl;
  final double? price;
  final int? ticketsCount;
  final int? availableTicketsCount;
  final String? eventId;
  final bool? isDisabled;

  factory TicketType.fromJson(Map<String, dynamic> json){
    return TicketType(
      id: json["id"],
      title: json["title"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      ticketsCount: json["ticketsCount"],
      availableTicketsCount: json["availableTicketsCount"],
      eventId: json["eventId"],
      isDisabled: json["isDisabled"],
    );
  }

}
