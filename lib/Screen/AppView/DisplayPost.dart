import 'package:blog_app/AppHelper/AppColors.dart';
import 'package:blog_app/AppHelper/AppSpaces.dart';
import 'package:blog_app/FlutterProvider/PostProvider.dart';
import 'package:blog_app/Model/Post.dart';
import 'package:blog_app/Route/Arguments/ArgumanetName.dart';
import 'package:blog_app/Route/Arguments/ScreenArguments.dart';
import 'package:blog_app/Widgets/ButtonWithIcon.dart';
import 'package:blog_app/Widgets/DisplayIamgeAndVideoWidget.dart';
import 'package:blog_app/Widgets/RoundedButtonWidget.dart';
import 'package:blog_app/Widgets/VideoViewWidget.dart';
import 'package:blog_app/Widgets/ViewImage.dart';
import 'package:blog_app/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayPost extends StatelessWidget {
  ScreenArguments screenArguments;

  DisplayPost({this.screenArguments});

  Post post;

  CarouselController carouselController = new CarouselController();

  PostProvider _postProvider;

  @override
  Widget build(BuildContext context) {
    post = screenArguments.data[ArgumentName.post];
    _postProvider = Provider.of<PostProvider>(context);
  //  left_and_right_button_visibility();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        banner(),
        title_and_descriprion(context),
      ],
    );
  }

  banner() {
    return Container(
      height: 300,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                viewportFraction: 1.0,
                height: 300,
                reverse: false,
                pauseAutoPlayInFiniteScroll: false,
                pauseAutoPlayOnTouch: false,
                onPageChanged: (int index, carosal_page) {
                  print("Current Index  ${index}");
                  _postProvider.change_carousel_index(index);
                }),
            items: post.url
                .map((item) => isImages(item)
                    ? ViewImageWidget(imageUrl: item)
                    : Material(
                        child: ViewVideoWidget(
                          videoUrl: item,
                        ),
                      ))
                .toList(),
          ),
          previous_button(),
          next_button(),
        ],
      ),
    );
  }

  previous_button() {
    return _postProvider.leftButtonVisbility
        ? Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButtonWidget(
                  button_size: 50,
                  icon_size: 30,
                  icon: Icons.chevron_left,
                  onClick: () {
                    print("Tes");

                    carouselController
                        .jumpToPage(_postProvider.carousel_current_index - 1);
                  }),
            ),
          )
        : Container();
  }

  next_button() {
    return _postProvider.right_button_visibility
        ? Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButtonWidget(
                  button_size: 50,
                  icon_size: 30,
                  icon: Icons.chevron_right,
                  onClick: () {
                    //if ()

                    carouselController
                        .jumpToPage(_postProvider.carousel_current_index + 1);
                  }),
            ),
          )
        : Container();
  }

  void left_and_right_button_visibility() {
    _postProvider.change_carousel_index(0);
    if (post.url.length == 0) {
      _postProvider.setLeftButtonVisibility(false);
      _postProvider.setRightButtonVisibility(false);
    }

    // if(carouselController.)
  }

  title_and_descriprion(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black,fontSize: 30),
          ),
          AppSpaces.spaces_height_25,
          Text(
            post.description,
            style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black54,fontSize: 16),
          )
        ],
      ),
    );
  }
}
