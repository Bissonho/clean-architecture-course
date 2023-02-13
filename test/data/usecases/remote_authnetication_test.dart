import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';
import 'package:teste_fvm/usecases/authentication.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    final bory = {'email': params.email, 'password': params.secret};
    await httpClient.request(url: url, method: "post", bory: bory);
  }
}

class HttpClientSpy extends Mock implements HttpClient {}

abstract class HttpClient {
  Future<void> request(
      {@required String url, @required String method, Map bory});
}

Future<void> main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should Call httpClient with correct values', () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());

    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        bory: {'email': params.email, 'password': params.secret}));
  });
}
