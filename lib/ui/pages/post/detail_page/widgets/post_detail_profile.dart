import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/models/post.dart';

class PostDetailProfile extends StatelessWidget {
  // 1. post 를 전달 받습니다.
  final Post post;
  const PostDetailProfile(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        // 2. username을 출력합니다.
        title: Text(post.user.username),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset('assets/default_profile.png'),
        ),
        subtitle: Row(
          children: [
            // 3. email을 출력합니다.
            Text(post.user.email),
            const SizedBox(width: mediumGap),
            const Text("·"),
            const SizedBox(width: mediumGap),
            const Text("Written on "),
            Text("May 25"),
          ],
        ));
  }
}
