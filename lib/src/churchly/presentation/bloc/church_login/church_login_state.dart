part of 'church_login_bloc.dart';

sealed class ChurchLoginState extends Equatable {
  const ChurchLoginState();

  @override
  List<Object> get props => [];
}

final class ChurchLoginInitial extends ChurchLoginState {}

final class ChurchLoginLoading extends ChurchLoginState {}

final class ChurchLoginCreateChurch extends ChurchLoginState {}

final class ChurchLoginSubmitted extends ChurchLoginState {
  final String? accountId;

  const ChurchLoginSubmitted({this.accountId});

  @override
  List<Object> get props => [];
}
