import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dtos/post_request.dart';
import 'package:flutter_blog/data/dtos/response_dto.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:logger/logger.dart';

void main() async {
  await updatePost_test();
}

Future<void> updatePost_test() async {
  // JWT 토큰은 만료될 수 있기 때문에, PostMan으로 요청한 뒤 Authorization 응답 헤더값을 사용하세요.
  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MSwiZXhwIjoxNjk2OTM4ODkyfQ.iNg126Bv-hF205q1XGhMZDZc5qukqpnfTqBi1uDMYpIucmIg6cfyXJ45ntrcpPajs02AAQCUAKADEX8h13VDJg';

  // 삭제하기 테스트시에 1번을 삭제했기 때문에 2번 내용을 수정해줍니다.
  int id = 2;
  PostUpdateReqDTO requestDTO =
      PostUpdateReqDTO(title: "수정제목", content: "수정내용");

  try {
    // 통신
    Response response = await dio.put(
      "/post/$id",
      options: Options(headers: {"Authorization": "$jwt"}),
      data: requestDTO.toJson(),
    );

    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = Post.fromJson(responseDTO.data);

    Logger().d(responseDTO.code);
    Logger().d(responseDTO.msg);
  } catch (e) {
    Logger().d("통신 실패");
  }
}

Future<void> deletePost_test() async {
  // JWT 토큰은 만료될 수 있기 때문에, PostMan으로 요청한 뒤 Authorization 응답 헤더값을 사용하세요.
  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MSwiZXhwIjoxNjk2OTM4ODkyfQ.iNg126Bv-hF205q1XGhMZDZc5qukqpnfTqBi1uDMYpIucmIg6cfyXJ45ntrcpPajs02AAQCUAKADEX8h13VDJg';
  int id = 1;

  try {
    // 통신
    Response response = await dio.delete("/post/$id",
        options: Options(headers: {"Authorization": "$jwt"}));
    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    Logger().d(responseDTO.code);
    Logger().d(responseDTO.msg);
  } catch (e) {
    Logger().d("통신 실패");
  }
}

Future<void> savePost_test() async {
  // JWT 토큰은 만료될 수 있기 때문에, PostMan으로 요청한 뒤 Authorization 응답 헤더값을 사용하세요.
  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MywiZXhwIjoxNjk2OTM4MjkzfQ.ryjSr1x49PpVGZuXXA6iaEvtHZXOHxZXVkgrGkXqVecfjuechyUm2dx48abw0Wi5UyX_Zgd4vYWenFRnvKTMyA';
  PostSaveReqDTO postSaveReqDTO = PostSaveReqDTO(title: "제목", content: "내용");

  try {
    // 통신
    Response response = await dio.post("/post",
        options: Options(headers: {"Authorization": "$jwt"}),
        data: postSaveReqDTO.toJson());
    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = Post.fromJson(responseDTO.data);

    Logger().d(responseDTO.code);
    Logger().d(responseDTO.msg);
  } catch (e) {
    Logger().d("통신 실패");
  }
}

Future<void> fetchPost_test() async {
  // given
  // JWT 토큰은 만료될 수 있기 때문에, PostMan으로 요청한 뒤 Authorization 응답 헤더값을 사용하세요.
  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MywiZXhwIjoxNjk2OTMyODA4fQ.YaGIDWlLGiFoB8uEVTb1S5rAT-n4fc0JM8MhM0d89VRk2UyPMwJq14Jcp5jjgY2IiNEj2PzgZaX8BMg7QsAOQw';
  int id = 1;

  // when
  try {
    // 통신
    Response response = await dio.get("/post/$id",
        options: Options(headers: {"Authorization": "$jwt"}));

    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = Post.fromJson(responseDTO.data);

    // 응답 받은 데이터 파싱
    Logger().d(responseDTO.code);
    Logger().d(responseDTO.msg);
  } catch (e) {
    Logger().d("통신 실패");
  }
}

Future<void> fetchPostList_test() async {
  // given
  // 1. JWT 토큰은 만료될 수 있기 때문에, PostMan으로 요청한 뒤 Authorization 응답 헤더값을 사용하세요.
  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MywiZXhwIjoxNjk2OTMyODA4fQ.YaGIDWlLGiFoB8uEVTb1S5rAT-n4fc0JM8MhM0d89VRk2UyPMwJq14Jcp5jjgY2IiNEj2PzgZaX8BMg7QsAOQw';

  // 2. jwt에 변수 값을 할당할 때에는 Postman 로그인 테스트에서 응답되는 토큰 값을 할당합니다.
  try {
    // 통신
    Response response = await dio.get("/post",
        options: Options(headers: {"Authorization": "$jwt"}));

    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    List<dynamic> mapList = responseDTO.data as List<dynamic>;
    List<Post> postList = mapList.map((e) => Post.fromJson(e)).toList();
    responseDTO.data = postList;

    // then
    Logger().d(responseDTO.code);
    Logger().d(responseDTO.msg);
  } catch (e) {
    Logger().d("통신 실패");
  }
}
