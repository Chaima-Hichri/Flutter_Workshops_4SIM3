import 'package:hive/hive.dart';
part 'Film.g.dart';

@HiveType(typeId: 1)
class Film {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final String image ;

  const Film(this.title,this.image,this.description,this.price);
}