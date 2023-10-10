import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 통신을 편하게 하기 위한 dio 라이브러리
final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.0.20:8080", // 명령프롬프트를 열고 ipconfig로 본인 ip를 확인하기
    contentType: "application/json; charset=utf-8",
  ),
);

// 휴대폰 로컬에 JWT 토큰을 저장하기 위한 라이브러리
const secureStorage = FlutterSecureStorage();
