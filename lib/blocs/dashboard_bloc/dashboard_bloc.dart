import 'package:ailoitte_task/models/rum_model.dart';
import 'package:ailoitte_task/resources/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetModelList>((event, emit) async {
      try {
        emit(DashboardLoading());
        final mList = await _apiRepository.fetchModelList(event.query);
        emit(DashboardLoaded(mList));
        if (mList.error != null) {
          emit(DashboardError(mList.error));
        }
      } on NetworkError {
        emit(const DashboardError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
