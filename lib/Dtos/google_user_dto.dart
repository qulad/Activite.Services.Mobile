import 'dart:convert';

import 'package:deneme/utils/dateonly.dart';
import 'package:uuid/uuid.dart';

class GoogleUserDto {
  final Uuid id;
  final String email;
  final String phoneNumber;
  final String region;
  final String type;
  final bool termsAndServicesAccepted;
  final bool verified;
  final String verificationCode;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String firstName;
  final String lastName;
  final DateOnly dateOfBirth;
  final String googleId;

  GoogleUserDto({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.region,
    required this.type,
    required this.termsAndServicesAccepted,
    required this.verified,
    required this.verificationCode,
    required this.createdAt,
    this.updatedAt,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.googleId
  });

  factory GoogleUserDto.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return GoogleUserDto(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      region: json['region'],
      type: json['type'],
      termsAndServicesAccepted: json['termsAndServicesAccepted'],
      verified: json['verified'],
      verificationCode: json['verificationCode'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: DateOnly.parse(json['dateOfBirth']),
      googleId: json['googleId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'email': email,
      'phoneNumber': phoneNumber,
      'region': region,
      'type': type,
      'termsAndServicesAccepted': termsAndServicesAccepted,
      'verified': verified,
      'verificationCode': verificationCode,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.toString(),
      'googleId': googleId
    };
  }
}