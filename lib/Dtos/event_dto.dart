import 'dart:convert';
import 'dart:ffi';

import 'package:deneme/Dtos/base/base_dto.dart';
import 'package:uuid/uuid.dart';

class EventDto extends BaseDto {
  final Uuid id;
  final Uuid locationId;
  final Uuid? ageRestrictionId;
  final Uuid offerId;
  final List<Uuid> visualMediaIds;
  final String name;
  final String description;
  final double amount;
  final String currency;
  final DateTime dateFrom;
  final DateTime dateTo;
  final DateTime createdAt;
  final DateTime? updatedAt;

  EventDto(
      {required this.id,
      required this.locationId,
      this.ageRestrictionId,
      required this.offerId,
      required this.visualMediaIds,
      required this.name,
      required this.description,
      required this.amount,
      required this.currency,
      required this.dateFrom,
      required this.dateTo,
      required this.createdAt,
      this.updatedAt});

  @override
  static EventDto fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return EventDto(
        id: json['id'],
        locationId: json['locationId'],
        ageRestrictionId: json['ageRestrictionId'],
        offerId: json['offerId'],
        visualMediaIds:
            json['visualMediaIds'].map((id) => Uuid.parse(id)).toList(),
        name: json['name'],
        description: json['description'],
        amount: json['amount'],
        currency: json['currency'],
        dateFrom: DateTime.parse(json['dateFrom']),
        dateTo: DateTime.parse(json['dateTo']),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'locationId': locationId.toString(),
      'ageRestrictionId': ageRestrictionId?.toString(),
      'offerId': offerId.toString(),
      'visualMediaIds': [visualMediaIds.map((id) => id.toString()).join(',')],
      'name': name,
      'description': description,
      'amount': amount,
      'currency': currency,
      'dateFrom': dateFrom.toIso8601String(),
      'dateTo': dateTo.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String()
    };
  }
}
