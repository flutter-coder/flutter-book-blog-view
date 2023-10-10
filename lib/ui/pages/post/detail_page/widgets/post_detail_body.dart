import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/data/providers/session_provider.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_buttons.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_content.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_profile.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/widgets/post_detail_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1.ConsumerWidget 변경
class PostDetailBody extends ConsumerWidget {
  final int postId;
  const PostDetailBody(this.postId, {Key? key}) : super(key: key);

  // 2. WidgetRef 추가
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. 프로바이더 접근
    PostDetailPageModel? model = ref.watch(postDetailPageProvider(postId));
    SessionUser sessionUser = ref.read(sessionProvider);

    // 4. 게시글이 존재하지 않으면, 프로그레스바 로딩하기
    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      // 5. 게시글이 존재하면 해당 게시글을 자식 컴퍼넌트들에게 전달하기
      Post post = model.post;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PostDetailTitle(post.title),
            const SizedBox(height: largeGap),
            PostDetailProfile(post), // 현재 오류 상태
            if (sessionUser.user?.id == post.user.id) PostDetailButtons(post),
            const Divider(),
            const SizedBox(height: largeGap),
            PostDetailContent(post.content),
          ],
        ),
      );
    }
  }
}
