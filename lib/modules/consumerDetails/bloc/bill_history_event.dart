import 'package:equatable/equatable.dart';
import 'package:upcl_fam_app/modules/consumerDetails/model/BillHistoryReqModel.dart';

abstract class BillHistoryEvent extends Equatable {
  const BillHistoryEvent();

  @override
  List<Object> get props => [];
}

class SearchButtonPressed extends BillHistoryEvent {
  final BillHistoryReqModel billHistoryRequest;

  const SearchButtonPressed({required this.billHistoryRequest});

  @override
  List<Object> get props => [billHistoryRequest];
}