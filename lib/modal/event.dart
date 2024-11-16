import 'package:intl/intl.dart';
class EventResponse {
  EventResponse({
    required this.data,
    required this.pageNumber,
    required this.pageSize,
    required this.totalCount,
  });

  List<Datum> data;
  final int? pageNumber;
  final int? pageSize;
  final int? totalCount;

  factory EventResponse.fromJson(Map<String, dynamic> json) {
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
    required this.formattedStartDate,
    required this.isDisabled,
    required this.images,
    required this.ticketTypes,
  });

  final String? id;
  final String? title;
  final DateTime? startDate;
  final DateTime? bookingStartDate;
  final String? formattedStartDate;
  final bool? isDisabled;
  final List<Image> images;
  final List<TicketType> ticketTypes;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
        id: json["id"],
        title: json["title"],
        startDate: DateTime.tryParse(json["startDate"] ?? ""),
        bookingStartDate: DateTime.tryParse(json["bookingStartDate"] ?? ""),
        isDisabled: json["isDisabled"],
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        ticketTypes: json["ticketTypes"] == null ? [] : List<TicketType>.from(json["ticketTypes"]!.map((x) => TicketType.fromJson(x))),
      formattedStartDate: json["startDate"] != null && DateTime.tryParse(json["startDate"]) != null
          ? DateFormat('EEEE، d MMMM y', 'ar_SA').format(DateTime.parse(json["startDate"])).replaceAll('٠', '0')
          .replaceAll('١', '1')
          .replaceAll('٢', '2')
          .replaceAll('٣', '3')
          .replaceAll('٤', '4')
          .replaceAll('٥', '5')
          .replaceAll('٦', '6')
          .replaceAll('٧', '7')
          .replaceAll('٨', '8')
          .replaceAll('٩', '9')
          : "",
        );
  }

  int get totalAvailableTickets => ticketTypes.fold(0, (sum, ticket) => sum + ticket.availableTicketsCount!.toInt());

  int? get startPrice => ticketTypes.map((ticket) => ticket.price).reduce((a, b) => a! < b! ? a : b)!.toInt();

  int? get endPrice => ticketTypes.map((ticket) => ticket.price).reduce((a, b) => a! > b! ? a : b)!.toInt();
}

class Image {
  Image({
    required this.imageUrl,
    required this.eventImageType,
  });

  final String? imageUrl;
  final int? eventImageType;

  factory Image.fromJson(Map<String, dynamic> json) {
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

  factory TicketType.fromJson(Map<String, dynamic> json) {
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
