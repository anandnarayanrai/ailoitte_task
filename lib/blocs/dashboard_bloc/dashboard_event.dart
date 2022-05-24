part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  DashboardEvent(this.query);

  String query;

  @override
  List<Object> get props => [];
}

class GetModelList extends DashboardEvent {
  GetModelList(String query) : super(query);
}
