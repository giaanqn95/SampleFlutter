import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/base_client/Repo.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'BaseResponse.dart';
import 'StateRepository.dart';

enum Domain {
  DEV,
  STAGING,
}

extension DomainExtensionMap on Domain {
  static const valuesMap = const {
    Domain.DEV: "https://api.tiktik.dev.intelin.vn/",
    Domain.STAGING: "https://api.tiktik.stg.intelin.vn/",
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

@immutable
abstract class RequestMethod {
  const RequestMethod();
}

class GetMethod extends RequestMethod {
  const GetMethod(this.repo);

  final Repo repo;

  Future<StateRepository> get() async {
    print("${DomainExtensionMap.valuesMap[getDomain()] + repo.url + repo.object}");
    return await http
        .get(DomainExtensionMap.valuesMap[getDomain()] + repo.url + repo.object,
            headers: repo.headers)
        .then((response) {
      return processResponse(response, repo.codeSuccess);
    });
  }
}

class PostMethod extends RequestMethod {
  const PostMethod(this.repo);

  final Repo repo;

  Future<StateRepository> post() async {
    print("${DomainExtensionMap.valuesMap[getDomain()] + repo.url}");
    return await http
        .post(DomainExtensionMap.valuesMap[getDomain()] + repo.url,
            headers: repo.headers, body: repo.object)
        .then((response) {
      return processResponse(response, repo.codeSuccess);
    });
  }
}

class PutMethod extends RequestMethod {
  const PutMethod(this.repo);

  final Repo repo;

  Future<StateRepository> put() async {
    print("${DomainExtensionMap.valuesMap[getDomain()] + repo.url}");
    await http
        .put(DomainExtensionMap.valuesMap[getDomain()] + repo.url,
            headers: repo.headers, body: repo.object)
        .then((response) {
      return processResponse(response, repo.codeSuccess);
    });
  }
}

class DeleteMethod extends RequestMethod {
  const DeleteMethod(this.repo);

  final Repo repo;

  Future<StateRepository> delete() async {
    print("${DomainExtensionMap.valuesMap[getDomain()] + repo.url}");
    await http
        .delete(DomainExtensionMap.valuesMap[getDomain()] + repo.url + repo.object,
            headers: repo.headers)
        .then((response) {
      return processResponse(response, repo.codeSuccess);
    });
  }
}

StateRepository processResponse(Response response, dynamic codeSuccess) {
  try {
    var data = BaseResponseA.fromJson(json.decode(response.body));
    print("Code response: ${data.code} - Code require: $codeSuccess - Is "
        "string ${codeSuccess is String} - Sure? ${codeSuccess == data.code}");
    if (codeSuccess is String && codeSuccess == data.code)
      return SuccessState(data);
    return ErrorState(data.code);
  } on HttpException catch (error) {
    print(error);
  } on Exception {
    return ErrorState(response.statusCode.toString());
  }
}
