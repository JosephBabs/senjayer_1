import 'dart:convert';

import 'package:dio/dio.dart';

// import 'package:get/get.dart';
import 'package:senjayer/api/api_routes.dart';
import 'package:senjayer/app/modules/auth/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // static const String baseUrl = "https://yourapi.com"; // Change this to your API
  // static const String loginUrl = "$baseUrl/auth/login";
  // static const String registerUrl = "$baseUrl/auth/register";

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        ApiRoutes.loginUrl,
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        await _saveUserData(data["access_token"], data["user"]);
        return {
          "success": true,
          "message": "Login successful",
          "user": data["user"],
        };
      } else {
        return {"success": false, "message": response.data["message"]};
      }
    } catch (e) {
      return {"success": false, "message": "Login failed: $e"};
    }
  }

  Future<Map<String, dynamic>> register(
    String firstName,
    String lastName,
    String phone,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      Response response = await _dio.post(
        ApiRoutes.registerUrl,
        queryParameters: {
          "firstName": firstName,
          "lastName": lastName,
          "phone": phone,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );

      if (response.statusCode == 201) {
        return {"success": true, "message": "Registration successful"};
      } else {
        return {
          "success": false,
          "message": response.data["message"] ?? "Unknown error",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Registration failed: $e"};
    }
  }

  Future<void> _saveUserData(String token, Map<String, dynamic> user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    await prefs.setString("user", jsonEncode(user));
  }

  Future<Map<String, dynamic>?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString("user");
    String? token = prefs.getString("token");

    if (userData != null && token != null) {
      return {
        "token": token,
        "user": jsonDecode(userData),
      }; // Decode only if stored as JSON
    }
    return null;
  }

Future<Map<String, dynamic>?> getEventsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    // print("Fetching events from: ${ApiRoutes.getEventsDetails}");

    try {
      Response response = await _dio.get(
        ApiRoutes.getEventsDetails,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      // print("API Response: ${response.data}");

      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": "Events retrieved successfully",
          "events": response.data,
        };
      } else {
        return {
          "success": false,
          "message": response.data["message"] ?? "Unknown error",
        };
      }
    } catch (e) {
      print("Error: $e"); // Debugging error
      return {"success": false, "message": "Failed to retrieve events: $e"};
    }
  }


Future<Map<String, dynamic>?> getUsersEventsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    // print("Fetching events from: ${ApiRoutes.getEventsDetails}");

    try {
      Response response = await _dio.get(
        ApiRoutes.getEvents,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      // print("API Response: ${response.data}");

      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": "Events retrieved successfully",
          "events": response.data,
        };
      } else {
        return {
          "success": false,
          "message": response.data["message"] ?? "Unknown error",
        };
      }
    } catch (e) {
      print("Error: $e"); // Debugging error
      return {"success": false, "message": "Failed to retrieve events: $e"};
    }
  }



  }


