import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

class Api {
  // static const baseUrl = "http://192.168.117.242:3000/api/rChurch/";
  static const baseUrl = "https://auth-tutos.web.app/api/rChurch/";

  // #1 Add Church

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

  // #2 Get Church id

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

  // #3 Update Church Financial Info to database.

  static Future<Map<String, dynamic>?> updateMonthlyFinancial(
      {String? cid,
      String? month,
      Map<String, List<Map<String, String>>?>? fData}) async {
    Uri url = Uri.parse("${baseUrl}updateFinanceData");

    try {
      // Validate input parameters
      if (cid!.isEmpty || month!.isEmpty || fData!.isEmpty) {
        return {
          "status": "error",
          "message": "Invalid parameters provided.",
        };
      }

      // Send the request
      final response = await http.post(
        url,
        body: jsonEncode({
          "churchID": cid,
          "month": month,
          "financialData": fData,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );

      // Handle the response
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          "status": "success",
          "message": "Financial Data Updated Successfully!",
          "updatedData": data,
        };
      } else {
        if (kDebugMode) {
          print(
              "Failed to update financial dart (updateMonthlyFinancialData): ${response.statusCode} ");
        }
        return {
          "status": "error",
          "message": "Failed to update financial data.",
        };
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error updataing financial data (updateMonth): $e");
      }
      return {
        "status": "error",
        "message": "An error occurred while updating financial data.",
      };
    }
  }

  // #4 - Get Monthly Chruch Financial Data

  static Future<Map<String, dynamic>?> getMonthlyFinancialData(
      String cid, String month) async {
    Uri url = Uri.parse("${baseUrl}fetch");

    try {
      final response = await http.post(
        url,
        body: {
          "requestID": cid,
          "month": month,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data != null) {
          return {
            "month": month,
            "Income": data['Income'] ?? [],
            "Expence": data['Expense'] ?? [],
          };
        }
      } else {
        if (kDebugMode) {
          print(
              "Failed to get Financial Data (getMonthlyFinancialData): ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("'Error retrieving church (getMonthlyFinancialData): $e");
      }
      return {'Message': 'An Error Occured...'};
    }
    return null;
  }
}
