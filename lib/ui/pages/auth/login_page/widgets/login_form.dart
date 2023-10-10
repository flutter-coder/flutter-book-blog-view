import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dtos/user_request.dart';
import 'package:flutter_blog/data/providers/session_provider.dart';
import 'package:flutter_blog/ui/widgets/custom_auth_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/custom_elavated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 프로바이더에 접근하려면 ref 객체가 필요하다.
// StatelessWidget에서 ConsumerWidget으로 변경하면 된다.

// 1. ConsumerWidget 변경
class LoginForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  // 2. WidgetRef 추가
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            text: "Username",
            obscureText: false,
            funValidator: validateUsername(),
            controller: _username,
          ),
          const SizedBox(height: mediumGap),
          CustomAuthTextFormField(
            text: "Password",
            obscureText: true,
            funValidator: validatePassword(),
            controller: _password,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
              text: "로그인",
              funPageRoute: () {
                // 3. 유효성 검사 통과 후 로그인 진행
                if (_formKey.currentState!.validate()) {
                  LoginReqDTO loginReqDTO = LoginReqDTO(
                      username: _username.text, password: _password.text);
                  ref.read(sessionProvider).login(loginReqDTO);
                }
              }),
        ],
      ),
    );
  }
}
