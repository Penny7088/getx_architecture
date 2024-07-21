import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/pages/main/render_strategy.dart';
import 'package:getx_architecture/base/view/common_base_view.dart';

import '../../../base/view/common_base_list_view.dart';
import 'main_controller.dart';
import 'main_state.dart';


class MainPage extends CommonBaseListView<MainController> {
  const MainPage({super.key});

  @override
  MainController get controller => Get.put(MainController(),tag: controllerTag());

  @override
  String controllerTag() {
    return "MainController";
  }

  @override
  Widget createListView(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (controller){
      return ListView.builder(
          itemBuilder: (context,index){
            Item item = controller.state.items[index];
            RenderStrategy strategy = StrategyFactory.createStrategy(item.type!);
            RenderContext renderContext = RenderContext(strategy);
            return renderContext.render(context);
          });
    });
  }
}
