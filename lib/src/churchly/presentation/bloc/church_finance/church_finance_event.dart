part of 'church_finance_bloc.dart';

sealed class ChurchFinanceEvent extends Equatable {
  const ChurchFinanceEvent();

  @override
  List<Object> get props => [];
}

final class OnChurchFinanceChangeItem extends ChurchFinanceEvent {
  final String? item;
  const OnChurchFinanceChangeItem({this.item});

  @override
  List<Object> get props => [item!];
}

final class OnChurchFinanceChangeAmount extends ChurchFinanceEvent {
  final String? amount;
  const OnChurchFinanceChangeAmount({this.amount});

  @override
  List<Object> get props => [amount!];
}

final class OnChurchFinanceSubmitted extends ChurchFinanceEvent {
  final String? item;
  final String? amount;
  const OnChurchFinanceSubmitted({this.item, this.amount});

  @override
  List<Object> get props => [item!, amount!];
}
