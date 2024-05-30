import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_architecture/base/view/common_base_view.dart';

import 'controller.dart';

/// FileName view
///
/// @Author mac
/// @Date 2024/5/29 10:54
///
/// @Description TODO

class SplashPage extends CommonBaseView<SplashController>{
  const SplashPage({super.key});

  @override
  String controllerTag() {
   return 'SplashController';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    // TODO: implement createChildBody
    throw UnimplementedError();
  }

}