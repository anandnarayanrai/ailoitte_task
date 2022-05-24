part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final RumModel rumModel;

  const DashboardLoaded(this.rumModel);
}

class DashboardError extends DashboardState {
  final String? message;

  const DashboardError(this.message);
}
