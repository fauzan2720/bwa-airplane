import 'package:quickalert/quickalert.dart';
import '/core.dart';

void showSuccess({String? message}) {
  QuickAlert.show(
    context: Get.currentContext,
    type: QuickAlertType.success,
    text: message ?? "Berhasil",
    confirmBtnColor: primaryColor,
  );
}
