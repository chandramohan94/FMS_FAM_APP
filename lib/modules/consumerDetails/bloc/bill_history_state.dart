
import 'package:equatable/equatable.dart';
import 'package:upcl_fam_app/modules/consumerDetails/model/BillHistoryResModel.dart';

abstract class BillHistoryState extends Equatable  {
  const BillHistoryState();

  @override
  List<Object> get props => [];
}

class BillHistoryInitial extends BillHistoryState {}

class BillHistoryLoading extends BillHistoryState {}

class BillHistorySuccess extends BillHistoryState {
  final BillHistoryResModel response;

  BillHistorySuccess({required this.response});

  @override
  List<Object?> get pragma => [response];
}

class BillHistoryFailure extends BillHistoryState {
  final String error;

  const BillHistoryFailure({required this.error});

  @override
  List<Object> get props => [error];
}