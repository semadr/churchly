import 'package:churchly/src/churchly/presentation/bloc/church_info/church_info_bloc.dart';

class DFieldEvent {
  ChurchInfoEvent findFieldEvent(String? dInput, String? labelKey) {
    // final dInput = dInputValue;
    ChurchInfoEvent? event;

    switch (labelKey) {
      case 'branchName':
        event = BranchNameChangeEvent(branchName: dInput!);
        break;
      case 'address':
        event = AddressChangeEvent(address: dInput!);
        break;
      case 'pastorName':
        event = PastorNameChangeEvent(pastorName: dInput!);
        break;
      case 'pastorNumber':
        event = PastorNumberChangeEvent(pastorNumber: dInput!.toString());
        break;
      case 'treasurerName':
        event = TreasurerNameChangeEvent(treasurerName: dInput!);
        break;
      case 'treasurerNumber':
        event = TreasurerNumberChangeEvent(treasurerNumber: dInput!.toString());
        break;
      case 'accountMonth':
        event = AccountMonthChangeEvent(accountMonth: dInput!.toString());
        break;
      case 'accountYear':
        event = AccountYearChangeEvent(accountYear: dInput!.toString());
        break;
      default:
        event = null;
        break;
    }
    return event!;
  }
}
