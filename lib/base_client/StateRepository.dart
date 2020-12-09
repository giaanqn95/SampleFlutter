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

abstract class StateRepository {
  static StateRepository find(StateRepository state) {
    if (state is LoadingState) {
      return state;
    } else if (state is SuccessState) {
      return state;
    } else if (state is ErrorState) {
      return state;
    } else {
      throw ("Unknow Error");
    }
    return LoadingState();
  }

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
