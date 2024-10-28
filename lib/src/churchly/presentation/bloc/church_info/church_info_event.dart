part of 'church_info_bloc.dart';

sealed class ChurchInfoEvent extends Equatable {
  const ChurchInfoEvent();

  @override
  List<Object> get props => [];
}

final class BranchNameChangeEvent extends ChurchInfoEvent {
  final String? branchName;

  const BranchNameChangeEvent({required this.branchName});

  @override
  List<Object> get props => [branchName!];
}

final class AddressChangeEvent extends ChurchInfoEvent {
  final String? address;

  const AddressChangeEvent({required this.address});

  @override
  List<Object> get props => [address!];
}

final class PastorNameChangeEvent extends ChurchInfoEvent {
  final String? pastorName;

  const PastorNameChangeEvent({required this.pastorName});

  @override
  List<Object> get props => [pastorName!];
}

final class PastorNumberChangeEvent extends ChurchInfoEvent {
  final String? pastorNumber;

  const PastorNumberChangeEvent({required this.pastorNumber});

  @override
  List<Object> get props => [pastorNumber!];
}

final class TreasurerNameChangeEvent extends ChurchInfoEvent {
  final String? treasurerName;

  const TreasurerNameChangeEvent({required this.treasurerName});

  @override
  List<Object> get props => [treasurerName!];
}

final class TreasurerNumberChangeEvent extends ChurchInfoEvent {
  final String? treasurerNumber;

  const TreasurerNumberChangeEvent({required this.treasurerNumber});

  @override
  List<Object> get props => [treasurerNumber!];
}

final class AccountMonthChangeEvent extends ChurchInfoEvent {
  final String? accountMonth;

  const AccountMonthChangeEvent({required this.accountMonth});

  @override
  List<Object> get props => [accountMonth!];
}

final class AccountYearChangeEvent extends ChurchInfoEvent {
  final String? accountYear;

  const AccountYearChangeEvent({required this.accountYear});

  @override
  List<Object> get props => [accountYear!];
}

final class SubmittedChangeEvent extends ChurchInfoEvent {
  
  @override
  List<Object> get props => [];
}
  
/*
  
- All fields will have an Event to Itself
  
*/
   