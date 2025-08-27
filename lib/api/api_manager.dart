import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import 'api_constants.dart';
import 'end_points.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourcesApi, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return SourceResponse.fromJson(json);
      } else {
        throw Exception(
            'HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  //  أضفت page و pageSize
  static Future<NewsResponse> getNewsSources(
    String sourceId, {
    int page = 1,
    int pageSize = 20, // ممكن تزوديها لحد 100 حسب الـ API
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    });

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return NewsResponse.fromJson(json);
      } else {
        throw Exception(
            'Failed to load news: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
