import 'package:url_launcher/url_launcher.dart';

void launcherOrari(String bus) {
  if (bus.endsWith("E")) {
    bus = bus.replaceAll("E", "");
    print(bus);
    launch(
        "http://actv.avmspa.it/sites/default/files/attachments/pdf/EN/E-$bus.pdf");
    return;
  }
  launch(
      "http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-$bus.pdf");
}
