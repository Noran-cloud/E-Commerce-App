part of 'harry_potter_cubit.dart';

@immutable
sealed class HarryPotterState {}

final class HarryPotterInitial extends HarryPotterState {}

final class HarryPotterLoading extends HarryPotterState {}

final class HarryPotterLoaded extends HarryPotterState {
  List<HarryPotterModel> harryPotterModel;
  HarryPotterLoaded(this.harryPotterModel);
}

final class HarryPotterError extends HarryPotterState {
  String err_msg;
  HarryPotterError(this.err_msg);
}
