abstract class BaseDto {
  BaseDto();

  static BaseDto fromJson(String jsonString) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();
}