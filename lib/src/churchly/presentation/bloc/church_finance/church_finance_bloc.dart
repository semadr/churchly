// import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/config/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:provider/provider.dart';

part 'church_finance_event.dart';
part 'church_finance_state.dart';

class ChurchFinanceBloc extends Bloc<ChurchFinanceEvent, ChurchFinanceState> {
  List<Map<String, String>>? expenseFinanceView;
  List<Map<String, String>>? incomeFinanceView;
  String? month;
  String? churchId;

  ChurchFinanceBloc() : super(ChurchFinanceInitial()) {
    // Change ItemField
    // on<OnChurchFinanceChangeItem>((event, emit) {
    //   try {
    //     item = event.item!;
    //   } catch (e) {
    //     if (kDebugMode) print('Emiting Error: $e');
    //   }
    // });

    // Change AmountField
    // on<OnChurchFinanceChangeAmount>((event, emit) {
    //   try {
    //     amount = event.amount!;
    //   } catch (e) {
    //     if (kDebugMode) print('Emiting Error: $e');
    //   }
    // });

    // Get ChurchID
    on<OnGetChurchId>((event, emit) {
      try {
        churchId = event.churchId;
      } catch (e) {
        if (kDebugMode) print('Emiting Error: $e');
      }
    });

    // SubmitTheFields
    on<OnChurchFinanceSubmitted>((event, emit) async {
      try {
        emit(ChurchFinanceLoading());
        final myEvent = Provider.of<ChurchFinanceItemProvider>(event.context!,
            listen: false);
        expenseFinanceView = myEvent.expenseFinanceView;
        incomeFinanceView = myEvent.incomeFinanceView;
        final subFinancialData = {
          "Income": incomeFinanceView,
          "Expense": expenseFinanceView,
        };

        final response = await Api.updateMonthlyFinancial(
          cid: "677d006fe44f76a062ba5dad",
          month: 4.toString(),
          fData: subFinancialData,
        );
      } catch (e) {
        if (kDebugMode) print('Emiting Error: $e');
      }
    });
  }
}
