import 'package:blog_app/AppHelper/AppConstant.dart';
import 'package:blog_app/Model/Voted.dart';

class Post {
  var user;
  String type;
  String title;
  String time;
  List<dynamic> url;
  String description;
  List<String> poll_data_list = new List();
  List<Voted> voted_list = new List();

  set_poll_data({data}) {
    /*print("VotedList  ${data}");
    Map<dynamic, dynamic> voted_list = data;
    voted_list.forEach((key, value) {
      print("The Value  ${value}");
    });*/
    data.forEach((e) {
      print("Voted List  ${e}");

      poll_data_list.add(e);
    });
  }

  set_voted_list({data}) {
    data.forEach((data) {
      print("Emailllllllllllllllll  ${data["email"]}");
      voted_list.add(Voted(email: data["email"], vot: data["vot"]));
    });
  }

  Post.loadData({value}) {
    title = value["title"];
    user = value["user"];
    type = value["type"];
    time = value["time"];
    url = value["url"];
    description = value["description"];

    if (value["type"] == AppConstant.poll) {
      print("Voted List   ${value["poll_data_list"]}");

      set_voted_list(data: value["voted_list"]);
      set_poll_data(data: value["poll_data_list"]);
    }
  }
// Post({
//   this.title,
//   this.user,
//   this.type,
//   this.time,
//   this.url,
//   this.description,
//   //this.poll_data_list,
//   this.voted_list,
//   this.poll_title,
// });
}
