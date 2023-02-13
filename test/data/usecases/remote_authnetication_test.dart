import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_fvm/data/http/http_client.dart';
import 'package:teste_fvm/data/usecases/remote_authenticate.dart';
import 'package:teste_fvm/domain/usecases/authentication.dart';

class HttpClientSpy extends Mock implements HttpClient {}

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
