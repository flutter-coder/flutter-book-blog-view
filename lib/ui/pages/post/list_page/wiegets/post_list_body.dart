import 'package:flutter/material.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_page.dart';
import 'package:flutter_blog/ui/pages/post/list_page/post_list_view_model.dart';
import 'package:flutter_blog/ui/pages/post/list_page/wiegets/post_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고에 접근하려면 ConsumerWidget이 되면 됩니다.
class PostListBody extends ConsumerWidget {
  const PostListBody({Key? key}) : super(key: key);

  // 2. ConsumerWidget이 되면, 파라메터로 WidgetRef에 접근할 수 있습니다.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. ref를 통해 창고 괸리자에게 접근하여 창고 데이터를 가져옵니다.
    PostListPageModel? model = ref.watch(postListPageProvider);
    List<Post> posts = model?.posts ?? [];
    return ListView.separated(
      // 4. 게시글 개수 만큼 List를 만듭니다.
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PostDetailPage(posts[index].id)),
            );
          },
          // 5. 게시글 하나를 전달합니다.
          child: PostListItem(posts[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
