import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/base_client/Repo.dart';
import 'package:http/http.dart';

import 'BaseResponse.dart';
import 'StateRepository.dart';

enum Domain {
  DEV,
  STAGING,
}

extension DomainExtensionMap on Domain {
  static const valuesMap = const {
    Domain.DEV: "a",
    Domain.STAGING: "a",
  };

  String get values => valuesMap[this];
}

Domain getDomain() {
  return Domain.DEV;
}

enum KeyRequest { GET_SOMETHING }

extension KeyExtensionMap on KeyRequest {
  static const valuesMap = const {
    KeyRequest.GET_SOMETHING: "a",
  };

  String get values => valuesMap[this];
}

abstract class RequestMethod {
  const RequestMethod();
}

class GetMethod extends RequestMethod {
  const GetMethod(this.repo);
  final Repo repo;

  Future<StateRepository> get() async {
    await Client()
        .get(DomainExtensionMap.valuesMap[getDomain()] + repo.url, headers: repo.headers)
        .then((response) {
      print("Response $response");
      return processResponse(response, repo.codeSuccess);
    });
  }
}

class PostMethod extends RequestMethod {
  const PostMethod(this.repo);
  final Repo repo;

  Future<StateRepository> post() async {
   return await Client()
        .post(DomainExtensionMap.valuesMap[getDomain()] + repo.url, headers: repo.headers,body: repo.object)
        .then((response) {
          print("Response $response");
          return processResponse(response, repo.codeSuccess);
     });
  }
}

class PutMethod extends RequestMethod {
  const PutMethod(this.repo);
  final Repo repo;

  Future<StateRepository> put() async {
    await Client()
        .put(DomainExtensionMap.valuesMap[getDomain()] + repo.url, headers: repo.headers,body: repo.object)
        .then((response) {
      print("Response $response");
      return processResponse(response, repo.codeSuccess);
    });
  }
}

class DeleteMethod extends RequestMethod {
  const DeleteMethod(this.repo);
  final Repo repo;

  Future<StateRepository> delete() async {
    await Client()
        .delete(DomainExtensionMap.valuesMap[getDomain()] + repo.url, headers: repo.headers)
        .then((response) {
      print("Response $response");
      return processResponse(response, repo.codeSuccess);
    });
  }
}

StateRepository processResponse(Response response, dynamic codeSuccess){
  try{
    var data = BaseResponseA.fromJson(json.decode(response.body));
    if(codeSuccess is String && codeSuccess == data.code)
      return SuccessState(data);
    return ErrorState(data.code);
  } on HttpException catch(error) {
    print(error);
  } on Exception {
    return ErrorState(response.statusCode.toString());
  }
}
