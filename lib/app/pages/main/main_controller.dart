import 'package:get/get.dart';
import 'package:getx_architecture/base/controller/common_controller.dart';

import 'main_state.dart';

class MainController extends CommonController<MainState> {
  final MainState state = MainState();

  @override
  MainState createState() {
   return state;
  }
}
