
import 'package:hive/hive.dart';

part 'student_model.g.dart';
@HiveType(typeId: 0)
class Students {
  @HiveField(0)
  String studentName;

  @HiveField(1)
  String studentClass;
  @HiveField(2)
  String studentAddress;
  @HiveField(3)
  String age;
   @HiveField(4)
   String? image;
  Students({
      required this.studentName,
      required this.studentClass,
      required this.studentAddress,
      required this.age,
      required this.image,
      });
}
