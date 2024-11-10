part of 'church_finance_bloc.dart';

sealed class ChurchFinanceState extends Equatable {
  const ChurchFinanceState();

  @override
  List<Object> get props => [];
}

final class ChurchFinanceInitial extends ChurchFinanceState {}

final class ChurchFinanceCreateSuceeded extends ChurchFinanceState {
  final String? item;
  final String? amount;

  const ChurchFinanceCreateSuceeded({this.item, this.amount});

  @override
  List<Object> get props => [];
}

final class ChurchFinanceLoading extends ChurchFinanceState {}
