import 'package:get/get.dart';
import 'package:getx_architecture/base/controller/common_controller.dart';
import 'package:getx_architecture/base/controller/common_list_controller.dart';

import 'main_state.dart';

class MainController extends CommonListController<MainState> {
  final MainState state = MainState();

  @override
  MainState createState() {
   return state;
  }

  @override
  configUI() {
   super.configUI();
  }
}
