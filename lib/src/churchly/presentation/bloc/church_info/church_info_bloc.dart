import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:churchly/src/config/api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'church_info_event.dart';
part 'church_info_state.dart';

class ChurchInfoBloc extends Bloc<ChurchInfoEvent, ChurchInfoState> {
  String? branchName;
  String? address;
  String? pastorName;
  String? pastorNumber;
  String? treasurerName;
  String? treasurerNumber;
  String? accountMonth;
  String? accountYear;

  // final churchInfoModel = ChurchInfo();

  ChurchInfoBloc() : super(ChurchInfoInitial()) {
    // BranchName
    on<BranchNameChangeEvent>((event, emit) {
      try {
        branchName = event.branchName!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // Address
    on<AddressChangeEvent>((event, emit) {
      try {
        address = event.address!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // PastorName
    on<PastorNameChangeEvent>((event, emit) {
      try {
        pastorName = event.pastorName!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // PastorNumber
    on<PastorNumberChangeEvent>((event, emit) {
      try {
        pastorNumber = event.pastorNumber!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // TreasurerName
    on<TreasurerNameChangeEvent>((event, emit) {
      try {
        treasurerName = event.treasurerName!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // TreasurerNumber
    on<TreasurerNumberChangeEvent>((event, emit) {
      try {
        treasurerNumber = event.treasurerNumber!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // AccountMonthChangeEvent
    on<AccountMonthChangeEvent>((event, emit) {
      try {
        accountMonth = event.accountMonth!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // AccountYearChangeEvent
    on<AccountYearChangeEvent>((event, emit) {
      try {
        accountYear = event.accountYear!;
      } catch (e) {
        if (kDebugMode) {
          print('Emiting error: $e');
        }
      }
    });

    // SubmittedChangeEvent
    on<SubmittedChangeEvent>((event, emit) async {
      try {
        emit(ChurchInfoLoading());
        Map<String, String> churchInfo = {
          "branchName": branchName!,
          "address": address!,
          "pastorName": pastorName!,
          "pastorNumber": pastorNumber!,
          "treasurerName": treasurerName!,
          "treasurerNumber": treasurerNumber!,
          "accountMonth": accountMonth!,
          "accountYear": accountYear!,
        };

        final response = await Api.addChurch(churchInfo);
        
        final resStatus = int.parse(response['status']!);

        if (resStatus == 201) {
          emit(ChurchInfoSubmitted(accountId: response['userId']));
        } else {
          emit(ChurchInfoInitial());
        }
      } catch (e) {
        if (kDebugMode) {
          emit(ChurchInfoInitial());
          print('Emiting error: $e');
        }
      }
    });
  }
}

// OnLastChange
// Emit Loading
// POST/ await response
// GET/ await response
// Emit ChurchInfoSumbitted -
