import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:blog_app/AppHelper/AppStyle.dart';
import 'package:blog_app/Model/Voted.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppPollViewWidget extends StatefulWidget {
  String title;
  List<String> poll_data_list;
  List<Voted> voted_list;

  AppPollViewWidget({this.title, this.poll_data_list, this.voted_list});

  @override
  _AppPollViewWidgetState createState() => _AppPollViewWidgetState();
}

class _AppPollViewWidgetState extends State<AppPollViewWidget>
    with AutomaticKeepAliveClientMixin {
  int voted_index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Title  ${widget.title}");
    return Container(
      // height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //AppSpaces.spaces_height_25,
            title(context),
            AppSpaces.spaces_height_15,
            poll(context)
          ],
        ),
      ),
    );
  }

  Column poll(BuildContext context) {
    return Column(
      children: widget.poll_data_list.map((item) {
        var total_voted = 0;
        widget.voted_list.forEach((voted_list) {
          if (voted_list.vot == widget.poll_data_list.indexOf(item)) {
            total_voted++;
          }
        });

        return InkWell(
          onTap: () {
            setState(() {
              voted_index = widget.poll_data_list.indexOf(item);
            });
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(45)),
                child: Center(
                  child: Row(
                    children: [
                      AppSpaces.spaces_width_20,
                      vote_selection(widget.poll_data_list.indexOf(item)),
                      AppSpaces.spaces_width_15,
                      poll_name(item, context),
                      Spacer(),
                      total_voted_view(total_voted),
                      AppSpaces.spaces_width_15
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Text poll_name(String item, BuildContext context) {
    return Text(
      "  ${item}",
      style: AppStyle.body(context: context),
      textAlign: TextAlign.start,
    );
  }

  Text title(BuildContext context) {
    return Text(
      "${widget.title}",
      style: AppStyle.body_header(context: context),
    );
  }

  @override
  bool get wantKeepAlive => true;

  vote_selection(int selected) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected == voted_index
              ? AppColors.radio_active_color
              : AppColors.radio_hover_color),
    );
  }

  total_voted_view(int total_voted) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.radio_active_color.withOpacity(0.6),
      ),
      child: Center(
        child: Text("${total_voted}"),
      ),
    );
  }
}
