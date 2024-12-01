  Api api = Api();
  String baseUrl = api.baseUrl;
  
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