import 'dart:convert';

class google_user_dto {
  final String id;
  final String email;
  final String phoneNumber;
  final String region;
  final String type;
  final bool termsAndServicesAccepted;
  final bool verified;
  final String verificationCode;
  final String createdAt;
  final String? updatedAt;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String googleId;

  google_user_dto({
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

  factory google_user_dto.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return google_user_dto(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      region: json['region'],
      type: json['type'],
      termsAndServicesAccepted: json['termsAndServicesAccepted'],
      verified: json['verified'],
      verificationCode: json['verificationCode'],
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
      'email': email,
      'phoneNumber': phoneNumber,
      'region': region,
      'type': type,
      'termsAndServicesAccepted': termsAndServicesAccepted,
      'verified': verified,
      'verificationCode': verificationCode,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt?.toString(),
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'googleId': googleId
    };
  }
}