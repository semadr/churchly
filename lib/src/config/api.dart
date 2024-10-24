import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

class Api {
  static const baseUrl = "http://192.168.0.166:3000/api/rChurch/";

  static Future<Map<String, String?>> addChurch(
      Map<String, String> cdata) async {
    Uri url = Uri.parse("${baseUrl}store");

    try {
      final res = await http.post(
        url,
        body: jsonEncode(cdata),
        headers: {"Content-Type": "application/json"},
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body.toString());

        if (data['userId'] != null) {
          return {
            'status': 201.toString(),
            'userId': data['userId']!,
          };
        } else {
          if (kDebugMode) {
            print("Uexpected response: userId missing!");
          }
          return {'message': 'An Error Occurred.'};
        }
      } else {
        if (kDebugMode) {
          print("Failed to add Church (status code: ${res.statusCode})");
        }
        return {
          'message': 'An Error Occured',
        };
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error Adding Church: $e');
      }
      return {
        'message': 'An Error Occurred.',
      };
    }
  }

  static Future<Map<int, String?>> getChurchId(String cid) async {
    Uri url = Uri.parse("${baseUrl}fetch");

    try {
      final response = await http.post(
        url,
        body: {"requestID": cid},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        if (data['userId'] != null) {
          final userId = data['userId'];
          // Compare the user-inputted ID with Database ID
          if (userId.startsWith(cid)) {
            if (kDebugMode) print('User ID matches (first 10 digits)!');

            return {
              0: 201.toString(),
              1: userId,
            };
          } else {
            if (kDebugMode) print('User ID does not match.');
            return {
              0: 401.toString(),
              1: null,
            };
          }
        } else {
          if (kDebugMode) print('No user ID found');
          return {
            0: 404.toString(),
            1: null,
          };
        }
      } else {
        if (kDebugMode) {
          print("Failed to Get Response (getChurchId): ${response.statusCode}");
        }
        return {
          0: 500.toString(),
          1: null,
        };
      }
    } catch (e) {
      if (kDebugMode) print('Error retrieving user ID (getChurchId): $e');
      return {
        0: 500.toString(),
        1: null,
      };
    }
  }
}
