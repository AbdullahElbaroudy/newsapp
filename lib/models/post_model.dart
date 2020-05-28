


class Post {
  String id;
  String title;
  String content;
  String dateWritten;
  String featuredImage;
  int voteUp;
  int voteDown;
  List<int> voters_up ;
  List<int> voters_down ;
  int userId;
  String categoryId;
  String createdAt;
  String updatedAt;

  Post({this.id, this.title, this.content, this.dateWritten, this.featuredImage,
      this.voteUp, this.voteDown, this.voters_up, this.voters_down, this.userId,
      this.categoryId, this.createdAt, this.updatedAt});



}