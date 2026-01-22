import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException exception) {
    if (exception.type == DioExceptionType.connectionTimeout) {
      return ServerFailure('Connection timeout');
    } else if (exception.type == DioExceptionType.sendTimeout) {
      return ServerFailure('Send timeout');
    } else if (exception.type == DioExceptionType.receiveTimeout) {
      return ServerFailure('Receive timeout');
    } else if (exception.type == DioExceptionType.badResponse) {
      return ServerFailure.fromResponse(
        exception.response!.statusCode!,
        exception.response!.data,
      );
    } else if (exception.type == DioExceptionType.cancel) {
      return ServerFailure('Request canceled');
    } else if (exception.type == DioExceptionType.unknown) {
      if (exception.error is SocketException) {
        return ServerFailure('No internet connection');
      } else {
        return ServerFailure('Unknown error , Please try again later!');
      }
    } else if (exception.type == DioExceptionType.connectionError) {
      return ServerFailure('No internet connection');
    } else {
      return ServerFailure('Server failure');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message'] ?? 'Client failure');
    } else if (statusCode == 404) {
      return ServerFailure(
        response['error']['message'] ??
            'Your request not found , please try again later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        response['error']['message'] ??
            'Internal server error , please try again later',
      );
    } else {
      return ServerFailure(response['error']['message'] ?? 'Server failure');
    }
  }
}
