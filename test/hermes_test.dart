import 'dart:convert';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() async {

  String _baseURL = 'http://localhost:8080';
  
  test('post', () async {

    var res = await http.post(Uri.parse("$_baseURL/user/create"), body: json.encode({
      "firstName": "Chinedu",
      "lastName": "Ezenma"
    }));


    var body = json.decode(res.body);

    print(body);

  });

  test('postQuery', () async {

    var res = await http.post(Uri.parse("$_baseURL/user/create?firstName=Chinedu&lastName=Ezenma"));

    var body = json.decode(res.body);

    print(body);

  });

  test('patch', () async {

    var res = await http.patch(Uri.parse("$_baseURL/user/update"), body: json.encode({
      "firstName": "Chinedu",
      "lastName": "Ezenma"
    }));


    var body = json.decode(res.body);

    print(body);

  });

  test('put', () async {

    var req = http.MultipartRequest('PUT', Uri.parse("$_baseURL/file/upload"));
    var file = await http.MultipartFile.fromPath('file', './test/hermes_test.dart');

    req.files.add(file);

    await req.send();
  });
}