import 'package:flutter/material.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/ui/pages/post/update_page/widgets/post_update_body.dart';

class PostUpdatePage extends StatelessWidget {
  // 1. 게시글 수정 페이지로 이동할 때, 기존 게시글 내용을 가지고 와야합니다.
  final Post post;
  const PostUpdatePage(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // 2. post 변수를 전달합니다.
      body: PostUpdateBody(post), // 현재 코드 오류 상태
    );
  }
}
