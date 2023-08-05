import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:waiter/core/class/statusrequest.dart';
import '../functions/checkintrnet.dart';
// import 'package:dio/dio.dart' as dio;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await post(Uri.parse(linkurl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> postheadData(
      String linkurl, Map data, String token) async {
    if (await checkInternet()) {
      var response = await post(Uri.parse(linkurl),
          body: data, headers: {'Authorization': "Bearer $token"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    if (await checkInternet()) {
      var response = await get(Uri.parse(linkurl));
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> getHeadData(
      String linkurl, String token) async {
    if (await checkInternet()) {
      var response = await get(Uri.parse(linkurl),
          headers: {'Authorization': "Bearer $token"});
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> putheadData(
      String linkurl, String token) async {
    if (await checkInternet()) {
      var response = await put(Uri.parse(linkurl),
          headers: {'Authorization': "Bearer $token"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> deleteheadData(
      String linkurl, String token) async {
    if (await checkInternet()) {
      var response = await delete(Uri.parse(linkurl),
          headers: {'Authorization': "Bearer $token"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
