import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dtos/post_request.dart';
import 'package:flutter_blog/data/models/post.dart';
import 'package:flutter_blog/ui/pages/post/detail_page/post_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. ConsumerWidget 변경
class PostUpdateForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  // 2. post 전달 받기
  final Post post;
  PostUpdateForm(this.post, {Key? key}) : super(key: key);

  // 3. WidgetRef 추가
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomTextFormField(
            controller: _title,
            // 4. title 값 연결
            initValue: post.title,
            hint: "Title",
            funValidator: validateTitle(),
          ),
          const SizedBox(height: smallGap),
          CustomTextArea(
            controller: _content,
            // 5. content 값 연결
            initValue: post.content,
            hint: "Content",
            funValidator: validateContent(),
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: "글 수정하기",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                // 6. 글 수정 통신 코드 추가
                PostUpdateReqDTO reqDTO = PostUpdateReqDTO(
                    title: _title.text, content: _content.text);
                await ref
                    .read(postDetailPageProvider(post.id).notifier)
                    .notifyUpdate(post.id, reqDTO);

                // 7. Navigator.pop 삭제
              }
            },
          ),
        ],
      ),
    );
  }
}
