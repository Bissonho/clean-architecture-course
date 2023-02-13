import 'package:meta/meta.dart';
import 'package:teste_fvm/domain/entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth(
      {@required String email, @required String password});
}
