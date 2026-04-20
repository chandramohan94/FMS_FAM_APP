import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login/service/ApiService.dart';
import 'bill_history_event.dart';
import 'bill_history_state.dart';

class BillHistoryBloc extends Bloc<BillHistoryEvent, BillHistoryState> {
  final ApiService _apiService = ApiService();
  BillHistoryBloc() : super(BillHistoryInitial()) {
    // Register event handler for LoginButtonPressed event
    on<SearchButtonPressed>(onSearchButtonPressed);
  }

  // Event handler for LoginButtonPressed event
  void onSearchButtonPressed(SearchButtonPressed event, Emitter<BillHistoryState> emit) async {
    emit(BillHistoryLoading());
    try {
      final response = await _apiService.fetchBillHistory(event.billHistoryRequest);
      if (response != null) {
        print(response.billDetails![0].billAmount); // print(response.empOfficeName);
        emit(BillHistorySuccess(response: response));
      } else {
        emit(BillHistoryFailure(error: 'Invalid username or password'));
        print("error");
      }
    } catch (error) {
      emit(BillHistoryFailure(error: 'An error occurred'));
      print("error");
    }
  }
}
