import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'dart:math';

import 'package:lecinemavirtuel/models/responseModel.dart';
import 'package:lecinemavirtuel/services/localStorage.dart';

import 'controller/main_controller.dart';

Random random = new Random();
LocalStorage localStorage = LocalStorage();
int randomNumber = random.nextInt(100);

class HttpInstance {
  HttpInstance._();

  static final instance = HttpInstance._();

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "charset": "utf-8",
    "x-RequestID": "$randomNumber",
    "Authorization": ""
  };

  Future getData({required String path}) async {
    var token = await localStorage.getData(name: 'token');
    headers['Authorization'] = "Bearer $token";
    print('token ${headers['Authorization']}');
    MainController c = Get.put(MainController());
    print('path $path');
    try {
      c.updateLoadingStatus(true);
      Future<http.Response> apiResponse =
          http.get(Uri.parse(path), headers: headers);
      http.Response response = await apiResponse;
      print('api $path');
      print('response code ${response.statusCode}');
      print('response ${response.body}');
      c.updateLoadingStatus(false);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ResponseModel.fromJson(jsonDecode(response.body));
      }
      return jsonDecode(response.body);
    } on SocketException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Error Occured.';
    } catch (e) {
      c.updateLoadingStatus(false);
      throw 'error occured';
    }
  }

  Future postData(String path, data) async {
    var token = await localStorage.getData(name: 'token');
    headers['Authorization'] = "Bearer $token";
    print('token ${headers['Authorization']}');
    MainController c = Get.put(MainController());
    try {
      c.updateLoadingStatus(true);
      Future<http.Response> apiResponse = http.post(
        Uri.parse(path),
        body: jsonEncode(data),
        headers: headers,
      );
      http.Response response = await apiResponse;
      print('api $path');
      print('api body ${jsonEncode(data)}');
      print('response code ${response.statusCode}');
      print('response ${response.body}');
      c.updateLoadingStatus(false);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ResponseModel.fromJson(jsonDecode(response.body));
      }
      ResponseModel decodedData =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode < 200 || response.statusCode > 299) {
        print('here');
        throw decodedData;
      }
      return decodedData.data ?? decodedData.message;
    } on SocketException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Error Occured.';
    } catch (e) {
      final ResponseModel error = e as ResponseModel;
      c.updateLoadingStatus(false);
      print('errr ${e.toString()} ');
      throw error.message ?? 'error occured';
    }
  }

  Future patchData(String path, data) async {
    var token = await localStorage.getData(name: 'token');
    headers['Authorization'] = "Bearer $token";
    print('token ${headers['Authorization']}');
    MainController c = Get.put(MainController());
    try {
      c.updateLoadingStatus(true);
      Future<http.Response> apiResponse = http.patch(
        Uri.parse(path),
        body: jsonEncode(data),
        headers: headers,
      );
      http.Response response = await apiResponse;
      print('api $path');
      print('api body ${jsonEncode(data)}');
      print('response code ${response.statusCode}');
      print('response ${response.body}');
      c.updateLoadingStatus(false);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ResponseModel.fromJson(jsonDecode(response.body));
      }
      ResponseModel decodedData =
          ResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode < 200 || response.statusCode > 299) {
        print('here');
        throw decodedData;
      }
      return decodedData.data ?? decodedData.message;
    } on SocketException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      c.updateLoadingStatus(false);
      throw 'Error Occured.';
    } catch (e) {
      final ResponseModel error = e as ResponseModel;
      c.updateLoadingStatus(false);
      print('errr ${e.toString()} ');
      throw error.message ?? 'error occured';
    }
  }
}

// class Controller extends GetxController {
//   // define loading state.
//   final isLoading = false.obs;

//   // update state
//   void updateLoadingStatus(state) => isLoading.value = state;
// }
