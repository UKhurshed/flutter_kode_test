// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UsersService extends UsersService {
  _$UsersService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UsersService;

  @override
  Future<Response<UsersResponse>> getUsers() {
    final Uri $url = Uri.parse('users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UsersResponse, UsersResponse>($request);
  }
}
