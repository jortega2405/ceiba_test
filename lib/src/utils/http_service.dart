
import 'dart:convert';
import 'package:test_ceiba_software/src/model/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_ceiba_software/src/utils/glob.dart';

class Services {

  static List<User> parseUsers(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList( );
  }

  static List<Posts> parsePosts(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Posts>((json) => Posts.fromJson(json)).toList( );
  }

  static Future<List<User>> getUsers()async {
    try {
      final response = await http.get(Glob().getHost() + '/users');
      if (response.statusCode == 200) {
        List<User> list = parseUsers(response.body);
        return list;
      }else{
        throw Exception("Error");
      }
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Posts>> getPosts()async {
    try {
      final response = await http.get(Glob().getHost() + '/posts');
      if (response.statusCode == 200) {
        List<Posts> list = parsePosts(response.body);
        return list;
      }else{
        throw Exception("Error");
      }
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Posts>> getPostsByUserId(int userId)async {
    try {
      final response = await http.get(Glob().getHost() + '/posts?userId=' + userId.toString());
      if (response.statusCode == 200) {
        List<Posts> list = parsePosts(response.body);
        return list;
      }else{
        throw Exception("Error");
      }
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  
  
}