import 'package:bloc/bloc.dart';

import '../../api/api.dart';
import '../../models/models.dart';
import '../../repository/repositories.dart';

class ExamCubit extends Cubit<ApiResponse> {
  ExamCubit() : super(ApiResponse.loading("loading"));

  Future<void> fetch() async {
    final ExamRepository repository = ExamRepository();
    try {
      final Exam data = await repository.request(name: "");
      emit(ApiResponse.completed(data));
    } catch (e) {
      emit(ApiResponse.error("$e"));
    }
  }
}