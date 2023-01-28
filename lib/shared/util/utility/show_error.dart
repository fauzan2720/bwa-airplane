import 'package:quickalert/quickalert.dart';
import '/core.dart';

void showError({String? message}) {
  QuickAlert.show(
    context: Get.currentContext,
    type: QuickAlertType.error,
    text: message ?? "Gagal",
    confirmBtnColor: primaryColor,
  );
}
