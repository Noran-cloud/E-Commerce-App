import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rwad2/Services/harryPotter_service.dart';
import 'package:rwad2/models/harryPotterModel.dart';

part 'harry_potter_state.dart';

class HarryPotterCubit extends Cubit<HarryPotterState> {
  HarryPotterService harryPotterService; // var harryPotterService = HarryPotterService();
  HarryPotterCubit(this.harryPotterService) : super(HarryPotterInitial());

  Future<void> getHarryBooks() async {
    emit(HarryPotterLoading());
    try {
      final harry = await harryPotterService.getHarryBooks();
      emit(HarryPotterLoaded(harry));
    } catch (e) {
      emit(HarryPotterError(e.toString()));
    }
  }
}
