import 'package:flutter/material.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/ui/pages/post/update_page/widgets/post_update_form.dart';

class PostUpdateBody extends StatelessWidget {
  // 1. post 전달 받기
  final Post post;
  const PostUpdateBody(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      // 2. post 넘겨주기
      child: PostUpdateForm(post), // 현재 오류 상태
    );
  }
}
