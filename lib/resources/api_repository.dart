import 'package:msa_software/models/users_model.dart';
import 'package:msa_software/resources/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Users>> fetchUserList() {
    return _provider.fetchUsers();
  }
}


class NetworkError extends Error {}