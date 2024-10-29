import 'package:churchly/src/churchly/presentation/bloc/d_manage_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'church_finance_event.dart';
part 'church_finance_state.dart';

class ChurchFinanceBloc extends Bloc<ChurchFinanceEvent, ChurchFinanceState> {
  String? item;
  String? amount;

  ChurchFinanceBloc() : super(ChurchFinanceInitial()) {
    // Change ItemField
    on<OnChurchFinanceChangeItem>((event, emit) {
      try {
        item = event.item!;
      } catch (e) {
        if (kDebugMode) print('Emiting Error: $e');
      }
    });

    // Change AmountField
    on<OnChurchFinanceChangeAmount>((event, emit) {
      try {
        amount = event.amount!;
      } catch (e) {
        if (kDebugMode) print('Emiting Error: $e');
      }
    });

    // SubmitTheFields
    on<OnChurchFinanceSubmitted>((event, emit) {
      try {
        // Map<String, String> dFData = {
        //   'item': item!,
        //   'amount': amount!,
        // };
        ChurchFinanceItem().addFinanceItem(item!, amount!);


      } catch (e) {
        if (kDebugMode) print('Emiting Error: $e');
      }
    });
  }
}
