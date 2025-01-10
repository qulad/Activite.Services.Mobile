import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:deneme/models/event.dart';

class DatabaseHelper {
  // Dosya yolu al
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/events.json';
  }

  // Verileri JSON dosyasına kaydet
  Future<void> saveEvents(List<Event> events) async {
    final file = File(await _getFilePath());

    // Event'leri JSON formatına dönüştür
    List<Map<String, dynamic>> jsonEvents =
        events.map((event) => event.toJson()).toList();

    // JSON verisini dosyaya yaz
    await file.writeAsString(jsonEncode(jsonEvents));
  }

  // JSON dosyasından verileri oku ve Event listesine dönüştür
  Future<List<Event>> loadEvents() async {
    final file = File(await _getFilePath());

    // Dosya mevcut değilse boş bir liste döndür
    if (!file.existsSync()) {
      return [];
    }

    // Dosyadaki veriyi al
    String content = await file.readAsString();

    // JSON verisini Event listesine dönüştür
    List<dynamic> jsonList = jsonDecode(content);
    return jsonList.map((json) => Event.fromJson(json)).toList();
  }

  // Geçmiş etkinlikleri yükle
  Future<List<Event>> loadPastEvents() async {
    final file = File(await _getFilePath());

    // Dosya mevcut değilse boş bir liste döndür
    if (!file.existsSync()) {
      return [];
    }

    // Dosyadaki veriyi al
    String content = await file.readAsString();

    // JSON verisini Event listesine dönüştür
    List<dynamic> jsonList = jsonDecode(content);
    return jsonList
        .where(
            (event) => DateTime.parse(event['date']).isBefore(DateTime.now()))
        .map((json) => Event.fromJson(json))
        .toList();
  }

  // Veritabanındaki tüm etkinlikleri sil
  Future<void> clearAllEvents() async {
    final file = File(await _getFilePath());
    if (file.existsSync()) {
      await file.delete();
    }
  }
}
