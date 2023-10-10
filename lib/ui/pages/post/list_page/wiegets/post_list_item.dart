import 'package:flutter/material.dart';
import 'package:flutter_blog/data/models/post.dart';

class PostListItem extends StatelessWidget {
  // 1. 생성자로 post 데이터를 전달 받습니다.
  final Post post;
  const PostListItem(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // 2. 제목을 추가해줍니다.
      title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
      // 3. 내용을 추가해줍니다.
      subtitle: Text(
        post.content,
        style: TextStyle(color: Colors.black45),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(50), // 네모난 이미지를 동그랗게 만들기 위한 값 설정
        child: Image.asset('assets/default_profile.png'), // 네모난 이미지
      ),
    );
  }
}
