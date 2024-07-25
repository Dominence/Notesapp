
class NotesModel{
   String? id;
   String category;
   String title;
   DateTime? createdAt;

   NotesModel({
    required this.category,
         this.id,
      required this.title,
      required this.createdAt,


});

  Map<String, dynamic> toMap(){
    return{
      "title" : title,
      "categories" : category,
      "createdAt" : createdAt.toString()
    };
  }
}