import 'package:flutter/cupertino.dart';
import 'package:teste_fvm/data/http/http_client.dart';
import 'package:teste_fvm/domain/usecases/authentication.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    await httpClient.request(url: url, method: "post", bory: params.toJson());
  }
}
