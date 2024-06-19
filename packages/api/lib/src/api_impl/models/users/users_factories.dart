import 'package:api/api.dart';

const usersFactories = <Type, JsonFactory>{
  UsersResponse: UsersResponse.fromJson,
  UsersResponseObject: UsersResponseObject.fromJson
};
