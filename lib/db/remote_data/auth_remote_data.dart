import 'dart:convert';
import 'package:tugas_firman/db/remote_data/network_service/network_service.dart';
import 'package:tugas_firman/model/auth_response_model.dart';
import 'package:tugas_firman/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteData {
  final String baseUrl;

  AuthRemoteData(NetworkService networkService, {required this.baseUrl});

  Future<AuthResponseModel> postLogin(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AuthResponseModel.fromJson(data);
    } else {
      throw Exception('Login gagal: ${response.body}');
    }
  }

  Future<AuthResponseModel> postRegister(
    String username,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AuthResponseModel.fromJson(data);
    } else {
      throw Exception('Register gagal: ${response.body}');
    }
  }

  Future<User> getProfile(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/user'),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Gagal mengambil profil: ${response.body}');
    }
  }
}