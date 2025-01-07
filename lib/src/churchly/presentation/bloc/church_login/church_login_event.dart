part of 'church_login_bloc.dart';

sealed class ChurchLoginEvent extends Equatable {
  const ChurchLoginEvent();

  @override
  List<Object> get props => [];
}

final class OnAccountIDFieldChange extends ChurchLoginEvent {
  final String? accountID;

  const OnAccountIDFieldChange({required this.accountID});

  @override
  List<Object> get props => [accountID!];
}

final class CreateChurchAccount extends ChurchLoginEvent {
  const CreateChurchAccount();

  @override
  List<Object> get props => [];
}

final class OnSubmittedChangeEvent extends ChurchLoginEvent {
  final BuildContext? context;

  const OnSubmittedChangeEvent({required this.context});

  @override
  List<Object> get props => [context!];
}
