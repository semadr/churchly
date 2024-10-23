import 'package:churchly/src/churchly/data/models/finance_data.dart';
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
        FinanceData fData = FinanceData();
        final int index = fData.dFinanceView!.length;

        Map<String, String> dFData = {
          'item': item!,
          'amount': amount!,
        };

        fData.updateFinanceView(index, dFData);
      } catch (e) {
        if (kDebugMode) print('Emiting Error: $e');
      }
    });
  }
}
