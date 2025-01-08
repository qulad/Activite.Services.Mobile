import 'dart:convert';
import 'dart:ffi';

import 'package:uuid/uuid.dart';

class EventDto {
  final Uuid id;
  final Uuid locationId;
  final Uuid? ageRestrictionId;
  final Uuid offerId;
  final List<Uuid> visualMediaIds;
  final String name;
  final String description;
  final Float amount;
  final String currency;
  final String dateFrom;
  final String dateTo;
  final String createdAt;
  final String? updatedAt;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String googleId;

  EventDto({
    required this.id,
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
    this.updatedAt,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.googleId
  });

  factory EventDto.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return EventDto(
      id: json['id'],
      locationId: json['locationId'],
      ageRestrictionId: json['ageRestrictionId'],
      offerId: json['offerId'],
      visualMediaIds: json['visualMediaIds'].map((id) => Uuid.parse(id)).toList(),
      name: json['name'],
      description: json['description'],
      amount: json['amount'],
      currency: json['currency'],
      dateFrom: json['dateFrom'],
      dateTo: json['dateTo'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      googleId: json['googleId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'locationId': locationId,
      'ageRestrictionId': ageRestrictionId,
      'offerId': offerId,
      'visualMediaIds': [visualMediaIds.map((id) => id.toString()).join(',')],
      'name': name,
      'description': description,
      'amount': amount,
      'currency': currency,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt?.toString(),
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'googleId': googleId
    };
  }
}