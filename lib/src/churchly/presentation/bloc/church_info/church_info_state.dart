part of 'church_info_bloc.dart';

sealed class ChurchInfoState extends Equatable {
  const ChurchInfoState();

  @override
  List<Object> get props => [];
}

final class ChurchInfoInitial extends ChurchInfoState {}

final class ChurchInfoLoading extends ChurchInfoState {}

final class ChurchInfoSubmitted extends ChurchInfoState {
  final String? accountId;

  const ChurchInfoSubmitted({this.accountId});

  @override
  List<Object> get props => [];
}

/* 
- Initial State
- Loading State
- Submitted State

 */