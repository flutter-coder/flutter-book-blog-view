import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_body.dart';

class PostDetailPage extends StatelessWidget {
  // 1. postId 전달 받는 코드 추가
  final int postId;
  const PostDetailPage(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // 2. postId 전달
      body: PostDetailBody(postId), // 현재 코드 오류 상태
    );
  }
}
