import 'package:churchly/src/churchly/presentation/bloc/church_finance/church_finance_bloc.dart';

class DFinanceFieldEvent {
  ChurchFinanceEvent findFinanceFieldEvent(String? dInput, String? labelKey) {
    // final dInput = dInputValue;
    ChurchFinanceEvent? event;

    switch (labelKey) {
      case 'pageItem' || 'dialogItem':
        event = OnChurchFinanceChangeItem(item: dInput!);
        break;
      case 'pageAmount' || 'dialogAmount':
        event = OnChurchFinanceChangeAmount(amount: dInput!);
        break;
      default:
        event = null;
        break;
    }
    return event!;
  }
}
