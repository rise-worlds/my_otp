import 'package:flutter/material.dart';
import 'package:my_otp/models/app_model.dart';

class OtpListPage extends StatelessWidget {
  const OtpListPage(this.data, {super.key});
  final List<OTPModel> data;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemBuilder: (BuildContext context, int position)
          {
            OTPModel app = data[position];
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    //backgroundImage: MemoryImage(app.icon),
                    backgroundColor: Colors.white,
                  ),
                  onTap: () => onAppClicked(context, app),
                  title: Text(app.issuer),
                  subtitle: Text(app.account),
                  // trailing: Text(app.secret),
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

  void onAppClicked(BuildContext context, OTPModel model) {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return AppInjectDialog(model: model);
    //     });
  }
}
