import '../../api/api.dart';
import '../../models/models.dart';

class ExamRepository {

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Exam> request ({required String name}) async {
    final response = await _helper.get(urlName: name,);
    return Exam.fromJson(response);
  }
}

