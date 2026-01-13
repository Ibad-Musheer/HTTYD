// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:httyd/service/storage_service.dart';
import 'package:http/http.dart' as http;

class Response {
  Map<String, dynamic>? data = {};
  bool success;
  String? error;

  Response({this.data, this.error, required this.success});

  factory Response.fromData({required Map<String, dynamic> data}) {
    return Response(success: true, data: data, error: null);
  }

  factory Response.fromError({required String error}) {
    return Response(success: false, data: null, error: error);
  }
}

class HttpService {
  static const commonHeaders = {'content-type': 'application/json'};

  static Future<Response> postImage(
    String url, {
    required File imageFile,
    Map<String, String>? fields,
    Map<String, String> headers = const {},
  }) async {
    String authToken = await StorageService.getAuthToken();
    try {
      var authHeaders = {
        "Authorization": "Bearer $authToken",
      };

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll({...commonHeaders, ...authHeaders, ...headers});

      // Add additional fields to the request
      if (fields != null) {
        request.fields.addAll(fields);
      }

      var multipartFile = await http.MultipartFile.fromPath(
        'File',
        imageFile.path,
      );
      // request.files.add(multipartFile);
      request.files
          .add(await http.MultipartFile.fromPath('File', imageFile.path));
      // request.files.add(http.MultipartFile.fromBytes(
      //     'file', await File.fromUri(Uri.parse(imageFile.path)).readAsBytes()));

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Response.fromData(data: jsonDecode(response.body));
      } else {
        return Response.fromError(error: response.body);
      }
    } catch (error) {
      return Response.fromError(error: error.toString());
    }
  }

  static Future<Response> get(
    String url, {
    Map<String, String> headers = const {},
    bool withAuth = false,
  }) async {
    String authToken = await StorageService.getAuthToken();
    var authHeaders = /*withAuth ? await getAuthHeaders() :*/ {
      "Authorization": "Bearer $authToken"
    };

    try {
      var response = await http.get(Uri.parse(url),
          headers: {...commonHeaders, ...authHeaders, ...headers});

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Response.fromData(data: jsonDecode(response.body));
      } else {
        return Response.fromError(error: response.body);
      }
    } catch (error) {
      return Response.fromError(error: error.toString());
    }
  }

  static Future<Response> post(
    String url, {
    required Map<String, dynamic> data,
    Map<String, String> headers = const {},
    bool withAuth = false,
  }) async {
    String authToken = await StorageService.getAuthToken();
    try {
      var authHeaders = /*withAuth ? await getAuthHeaders() :*/ {
        "Authorization": "Bearer $authToken"
      };
      var response = await http.post(Uri.parse(url),
          headers: {...commonHeaders, ...authHeaders, ...headers},
          body: jsonEncode(data));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Response.fromData(data: jsonDecode(response.body));
      } else {
        return Response.fromError(error: response.body);
      }
    } catch (error) {
      return Response.fromError(error: error.toString());
    }
  }

  static Future<Response> delete(
    String url, {
    Map<String, dynamic> data = const {},
    Map<String, String> headers = const {},
    bool withAuth = false,
  }) async {
    String authToken = await StorageService.getAuthToken();
    try {
      var authHeaders = /*withAuth ? await getAuthHeaders() :*/ {
        "Authorization": "Bearer $authToken"
      };
      var response = await http.delete(
        Uri.parse(url),
        headers: {...commonHeaders, ...authHeaders, ...headers},
        body: jsonEncode(data),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Response.fromData(data: jsonDecode(response.body));
      } else {
        return Response.fromError(error: response.body);
      }
    } catch (error) {
      return Response.fromError(error: error.toString());
    }
  }

  static Future<Response> put(
    String url, {
    required Map<String, dynamic> data,
    Map<String, String> headers = const {},
    bool withAuth = false,
  }) async {
    String authToken = await StorageService.getAuthToken();
    try {
      var authHeaders = /*withAuth ? await getAuthHeaders() :*/ {
        "Authorization": "Bearer $authToken"
      };

      var response = await http.put(Uri.parse(url),
          headers: {...commonHeaders, ...authHeaders, ...headers},
          body: jsonEncode(data));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Response.fromData(data: jsonDecode(response.body));
      } else {
        return Response.fromError(error: response.body);
      }
    } catch (error) {
      return Response.fromError(error: error.toString());
    }
  }

  static Future<Response> patch(
    String url, {
    Map<String, dynamic>? data,
    Map<String, String> headers = const {},
    bool withAuth = false,
  }) async {
    String authToken = await StorageService.getAuthToken();
    try {
      var authHeaders = /*withAuth ? await getAuthHeaders() :*/ {
        "Authorization": "Bearer $authToken"
      };
      var response = await http.patch(Uri.parse(url),
          headers: {...commonHeaders, ...authHeaders, ...headers},
          body: jsonEncode(data));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Response.fromData(data: jsonDecode(response.body));
      } else {
        return Response.fromError(error: response.body);
      }
    } catch (error) {
      return Response.fromError(error: error.toString());
    }
  }
}
