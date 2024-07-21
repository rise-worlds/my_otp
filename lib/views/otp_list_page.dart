import 'package:flutter/material.dart';
import 'package:my_otp/models/app_model.dart';

class OtpListPage extends StatelessWidget {
  const OtpListPage(this.data, {super.key});
  final List<AppModel> data;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemBuilder: (BuildContext context, int position)
          {
            AppModel app = data[position];
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: MemoryImage(app.icon),
                    backgroundColor: Colors.white,
                  ),
                  onTap: () => onAppClicked(context, app),
                  title: Text('${app.appName} (${app.packageName})'),
                  subtitle: Text(//'Version: ${app.versionName}\n'
                    // 'System app: ${app.systemApp}\n'
                      'APK file path: ${app.apkFilePath}\n'
                          'Data dir: ${app.dataDir}\n'
                    // 'Installed: ${DateTime.fromMillisecondsSinceEpoch(app.installTimeMillis).toString()}\n'
                    // 'Updated: ${DateTime.fromMillisecondsSinceEpoch(app.updateTimeMillis).toString()}'
                  ),
                ),
                const Divider(
                  height: 1.0,
                )
              ],
            );
          },
          itemCount: data.length
      ),
    );
  }

  void onAppClicked(BuildContext context, AppModel model) {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return AppInjectDialog(model: model);
    //     });
  }
}
