import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base_client/StateRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_client/MethodAPI.dart';
import 'base_client/Repo.dart';
import 'base_client/bloc/BlocRepository.dart';

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': '<Your token>'
};

class SampleCallApi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SampleCallApiState();
}

class SampleCallApiState extends State<SampleCallApi> {
  @override
  void initState() {
    //
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RequestBloc>(context).loadCurrencyRates(GetMethod(Repo(
        url: "user/register/",
        headers: requestHeaders,
        codeSuccess: "USERNAME_2000",
        object: "0901169215")));
    return Scaffold(
      // Scaffold đang là cha của MyButtonWidget
      body: BlocBuilder<RequestBloc, StateRepository>(
        builder: (BuildContext context, StateRepository state) {
          print("BuildContext $state");
          if (state is LoadingState) {
            return _LoadingIndicator();
          } else if (state is SuccessState) {
            return WidgetButton(state.baseResponse.data.toString());
          } else if (state is ErrorState) {
            return _ErrorMessage(error: state.error);
          } else {
            throw ("Unknow state $state");
          }
        },
      ),
    );
  }
}

class WidgetButton extends StatefulWidget {
  WidgetButton(this.base) : super();
  final String base;

  @override
  WidgetButtonState createState() => WidgetButtonState(base);
}

class WidgetButtonState extends State<WidgetButton> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  WidgetButtonState(this.base) : super();
  final String base;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: FlatButton(
          child: Text(base),
          color: Colors.pink,
          onPressed: () {
            BlocProvider.of<RequestBloc>(context).loadCurrencyRates(GetMethod(
                Repo(
                    url: "user/register/",
                    headers: requestHeaders,
                    codeSuccess: "USERNAME_2000",
                    object: "0901169215")));
          },
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _ErrorMessage extends StatelessWidget {
  final dynamic error;

  const _ErrorMessage({
    @required this.error,
    Key key,
  })  : assert(error != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$error'),
            const SizedBox(height: 16),
            IconButton(
              icon: const Icon(Icons.refresh),
              iconSize: 32,
              onPressed: () => BlocProvider.of<RequestBloc>(context)
                  .loadCurrencyRates(GetMethod(Repo(
                      url: "user/register/",
                      headers: requestHeaders,
                      codeSuccess: "USERNAME_2000",
                      object: "0901169215"))),
            ),
          ],
        ),
      ),
    );
  }
}
