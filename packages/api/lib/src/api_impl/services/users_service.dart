import 'package:api/src/api_impl/models/users/requests/users_request.dart';
import 'package:api/src/api_impl/models/users/responses/users_response.dart';
import 'package:chopper/chopper.dart';

part 'users_service.chopper.dart';

@ChopperApi(baseUrl: 'users')
abstract class UsersService extends ChopperService {
  static UsersService create([ChopperClient? client]) => _$UsersService(client);

  @Get()
  Future<Response<UsersResponse>> getUsers();
}
