class Post {
  /// object field lari
  int? id;
  String? title;
  String? body;
  int? userId;

  /// object canstructuri bu obyektga qiymat berish uchun ishlatiladi
  Post({this.id, this.title, this.body, this.userId});

  /// Jsonformatdan objectga o'tkazish uchun
  Post.fromJson(Map<String, dynamic>json):
      id=json['id'],
      title = json['title'],
      body =json['body'],
      userId =json['userId'];

  /// bu function obyecni mapga aylantiradi
  Map<String, String>toJson(){
    return{
      'id':id.toString(),
      'title':title!,
      'body':body!,
      'userId':userId.toString()
    };
  }
}
