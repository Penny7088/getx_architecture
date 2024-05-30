import 'package:flutter/material.dart';
import 'package:getx_architecture/base/view/common_base_view.dart';

import 'main_controller.dart';


class MainPage extends CommonBaseView<MainController> {
  const MainPage({super.key});

  @override
  String controllerTag() {
    return "MainController";
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    throw UnimplementedError();
  }
}
