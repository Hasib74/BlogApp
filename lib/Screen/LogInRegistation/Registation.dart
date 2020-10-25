import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:blog_app/FlutterProvider/AuthenticationProvider.dart';
import 'package:blog_app/FlutterProvider/LogInAndRegistationProvider.dart';
import 'package:blog_app/Route/Route.dart';
import 'package:blog_app/Widgets/ButtonWithIcon.dart';
import 'package:blog_app/Widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class Registation extends StatelessWidget {
  TextEditingController controller_name = new TextEditingController();
  TextEditingController controller_email = new TextEditingController();
  TextEditingController controller_nid = new TextEditingController();
  TextEditingController controller_phone_number = new TextEditingController();

  LogInAndRegistationProvider logInAndRegistationProvider;
  AuthenticationProvider authenticationProvider;

  @override
  Widget build(BuildContext context) {
    logInAndRegistationProvider =
        Provider.of<LogInAndRegistationProvider>(context);
    authenticationProvider = Provider.of<AuthenticationProvider>(context);
    authenticationProvider.setView(context: context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              top(context),
              AppSpaces.spaces_height_25,
              AppSpaces.spaces_height_25,
              textFileds(),
              AppSpaces.spaces_height_25,
              note_fingar_print_and_face(context),
              AppSpaces.spaces_height_25,
              confirm_button(context),
              AppSpaces.spaces_height_25,
            ],
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
    return Column(
      children: [
        DefaultTextField(
            controller: controller_name,
            label: language.name,
            onChange: (value) {
              logInAndRegistationProvider.loadView();
            },
            errorText: logInAndRegistationProvider.validation(
                name: controller_name.value.text,
                validationOnly: language.name)),
        AppSpaces.spaces_height_25,
        DefaultTextField(
            onChange: (value) {
              logInAndRegistationProvider.loadView();
            },
            controller: controller_email,
            label: language.email,
            errorText: logInAndRegistationProvider.validation(
                email: controller_email.value.text,
                validationOnly: language.email)),
        AppSpaces.spaces_height_25,
        DefaultTextField(
            onChange: (value) {
              logInAndRegistationProvider.loadView();
            },
            controller: controller_nid,
            label: language.nid,
            errorText: logInAndRegistationProvider.validation(
                nid: controller_nid.value.text, validationOnly: language.nid)),
        AppSpaces.spaces_height_25,
        DefaultTextField(
            onChange: (value) {
              logInAndRegistationProvider.loadView();
            },
            textInputType: TextInputType.phone,
            controller: controller_phone_number,
            label: language.phone_number,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Text(
                "+880",
              ),
            ),
            errorText: logInAndRegistationProvider.validation(
                phoneNumber: controller_phone_number.value.text,
                validationOnly: language.phone_number)),
      ],
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

  confirm_button(context) {
    return Button_with_icon_and_text(
        height: 40,
        padding_left: 60,
        padding_right: 60,
        onlyText: true,
        button_name: language.confirm,
        onClick: () {
          if (controller_name.text.isNotEmpty &&
              controller_phone_number.text.isNotEmpty &&
              controller_email.text.isNotEmpty &&
              controller_email.text.contains("@") &&
              controller_nid.text.isNotEmpty) {
            logInAndRegistationProvider.checkBiometric(context).then((value) {
              print("Authentication value  ${value}");

              if (value) {
                authenticationProvider.setFingerPrintAuthentication(
                    isAuthenticate: value);

                logInAndRegistationProvider.verifyPhoneNumber(
                    context: context,
                    phoneNumber: controller_phone_number.value.text);
              }
            });
          }
        });
  }
}
