import 'package:flutter/cupertino.dart';
import 'package:flutter_app/base_client/BaseResponse.dart';

class LoadingState extends StateRepository {
  LoadingState();
}

class SuccessState extends StateRepository {
  final BaseResponseA baseResponse;

  SuccessState(this.baseResponse);
}

class ErrorState extends StateRepository {
  final String error;

  ErrorState(this.error);
}

@immutable
abstract class StateRepository {
  T use<T>(
      T Function(LoadingState) useLoadingState,
      T Function(SuccessState) useChooseAccountState,
      T Function(ErrorState) useImportingState) {
    if (this is LoadingState) {
      return useLoadingState(this);
    }
    if (this is SuccessState) {
      return useChooseAccountState(this);
    }
    if (this is ErrorState) {
      return useImportingState(this);
    }
    throw Exception('Invalid state');
  }
}
