import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Widgets/ButtonWithIcon.dart';
import 'package:blog_app/Widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../main.dart';

class Registation extends StatelessWidget {
  TextEditingController controller_name = new TextEditingController();
  TextEditingController controller_email = new TextEditingController();
  TextEditingController controller_nid = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                top(context),
                Spacer(),
                textFileds(),
                Spacer(),
                note_fingar_print_and_face(context),
                Spacer(),
                confirm_button(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row top(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${language.user_registation}",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black, fontSize: 30),
        ),
        InkWell(
          onTap: () {
            back(context);
          },
          child: Icon(
            Icons.close,
          ),
        )
      ],
    );
  }

  textFileds() {
    return SingleChildScrollView(
      child: Column(
        children: [
          DefaultTextField(controller: controller_name),
          AppSpaces.spaces_height_25,
          DefaultTextField(controller: controller_email),
          AppSpaces.spaces_height_25,
          DefaultTextField(controller: controller_nid),
        ],
      ),
    );
  }

  note_fingar_print_and_face(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "*",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 20, color: Colors.red),
            ),
            AppSpaces.spaces_height_10,
            Flexible(
              child: Text(
                "${language.note_fingar_print}",
                softWrap: true,
              ),
            ),
          ],
        ),
        AppSpaces.spaces_height_25,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "*",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 20, color: Colors.red),
            ),
            AppSpaces.spaces_height_10,
            Flexible(
              child: Text(
                "${language.note_face_recognaization}",
                softWrap: true,
              ),
            ),
          ],
        )
      ],
    );
  }

  confirm_button() {
    return Button_with_icon_and_text(
      height: 40,
      padding_left: 60,
      padding_right: 60,
      onlyText: true,
      button_name: language.confirm,
    );
  }
}
