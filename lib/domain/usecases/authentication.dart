import 'package:meta/meta.dart';
import 'package:teste_fvm/domain/entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth({AuthenticationParams params});
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({@required this.email, @required this.secret});
}
