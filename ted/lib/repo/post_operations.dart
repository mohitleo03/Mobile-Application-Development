import 'package:ted/models/post.dart';
//Singleton
class PostOperations {
  static PostOperations _postOperations = PostOperations();
  _PostOperation(){}
  static PostOperations getInstance(){
      return _postOperations;
  }
  
  List<post> getPost() {
    return [
      post(
        post_author: "Manish Kumar Sharma",
        post_name: "Rest mode all day every day ~panda",
        post_image:"https://images.chinahighlights.com/allpicture/2020/08/826a518ea9fc46d4b5adcc38_cut_800x500_61.jpg",
        post_time: "24:00"),
      post(
        post_author: "Mohit Malik", 
        post_name: "No time", 
        post_image: "https://i.imgflip.com/5yzar7.png", 
        post_time: "00:00"),
      post(
        post_author: "Amit Srivastav", 
        post_name: "Flutter Learning", 
        post_image: "https://pi.tedcdn.com/r/talkstar-photos.s3.amazonaws.com/uploads/8f5d406f-002e-4d5a-bfc5-5fd193dfb7b6/MaryRoach_2009-1350x675.jpg", 
        post_time: "16:00"),
      post(
        post_author: "Amit Srivastav", 
        post_name: "Flutter Learning", 
        post_image: "https://pi.tedcdn.com/r/talkstar-photos.s3.amazonaws.com/uploads/8f5d406f-002e-4d5a-bfc5-5fd193dfb7b6/MaryRoach_2009-1350x675.jpg", 
        post_time: "16:00"),
      post(
        post_author: "Amit Srivastav", 
        post_name: "Flutter Learning", 
        post_image: "https://pi.tedcdn.com/r/talkstar-photos.s3.amazonaws.com/uploads/8f5d406f-002e-4d5a-bfc5-5fd193dfb7b6/MaryRoach_2009-1350x675.jpg", 
        post_time: "16:00"),
      post(
        post_author: "Amit Srivastav", 
        post_name: "Flutter Learning", 
        post_image: "https://pi.tedcdn.com/r/talkstar-photos.s3.amazonaws.com/uploads/8f5d406f-002e-4d5a-bfc5-5fd193dfb7b6/MaryRoach_2009-1350x675.jpg", 
        post_time: "16:00")
      ];

  }
}
