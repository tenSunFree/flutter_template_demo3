// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:flutter_template_demo3/home/model/home_chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$HomeChopperService extends HomeChopperService {
  _$HomeChopperService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HomeChopperService;

  @override
  Future<Response<List<HomePhotosBean>>> getPhotos() {
    final $url = 'todos';
    // final $body = user;
    final $request = Request('GET', $url, client.baseUrl);
    log.d('signUp, baseUrl: ${client.baseUrl}');
    return client.send<List<HomePhotosBean>, HomePhotosBean>($request);
    //  return client.send<List<Task>, Task>($request);
  }

  @override
  Future<Response<dynamic>> addNotificationsToken(String token) {
    final $url = '/user/notifications-token';
    final $body = token;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<void>> logout() {
    final $url = '/user/logout';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  @override
  Future<Response<void>> deactivate() {
    final $url = '/user';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }
}