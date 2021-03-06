import 'dart:async';

import 'package:flutter_app/base_client/BaseResponse.dart';
import 'package:flutter_app/base_client/Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../MethodAPI.dart';
import '../StateRepository.dart';

class RequestBloc extends Bloc<RequestMethod, StateRepository> {
  RequestBloc({StateRepository initialState}) : super(initialState);

  void loadCurrencyRates(RequestMethod requestMethod) {
    print("loadCurrencyRates $requestMethod");
    add(requestMethod);
  }

  @override
  Stream<StateRepository> mapEventToState(RequestMethod request) async* {
    print("mapEventToState $request");
    if (request is GetMethod)
      yield* get(request);
    else if (request is PostMethod)
      yield* post(request);
    else if (request is PutMethod)
      yield* put(request);
    else if (request is DeleteMethod) yield* delete(request);
  }

  Stream<StateRepository> get(GetMethod request) async* {
    try {
      print("get ${request.repo.url}");
      yield LoadingState();
      final StateRepository rates = await request.get();
      if (rates is SuccessState)
        yield SuccessState(rates.baseResponse);
      else if (rates is ErrorState) yield ErrorState(rates.error);
    } catch (e) {
      yield ErrorState(e);
    }
  }

  Stream<StateRepository> post(PostMethod request) async* {
    try {
      print("post ${request.repo.url}");
      yield LoadingState();
      final StateRepository rates = await request.post();
      if (rates is SuccessState)
        yield SuccessState(rates.baseResponse);
      else if (rates is ErrorState) yield ErrorState(rates.error);
    } catch (e) {
      yield ErrorState(e);
    }
  }

  Stream<StateRepository> put(PutMethod request) async* {
    try {
      print("put ${request.repo.url}");
      yield LoadingState();
      final StateRepository rates = await request.put();
      if (rates is SuccessState)
        yield SuccessState(rates.baseResponse);
      else if (rates is ErrorState) yield ErrorState(rates.error);
    } catch (e) {
      yield ErrorState(e);
    }
  }

  Stream<StateRepository> delete(DeleteMethod request) async* {
    try {
      print("delete ${request.repo.url}");
      yield LoadingState();
      final StateRepository rates = await request.delete();
      if (rates is SuccessState)
        yield SuccessState(rates.baseResponse);
      else if (rates is ErrorState) yield ErrorState(rates.error);
    } catch (e) {
      yield ErrorState(e);
    }
  }

  @override
  Future<void> close() async {
    super.close();
  }
}

extension DurationExt on int {
  Duration get seconds => Duration(seconds: this);
}
