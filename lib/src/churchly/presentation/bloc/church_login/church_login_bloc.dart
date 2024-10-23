import 'package:churchly/src/config/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'church_login_event.dart';
part 'church_login_state.dart';

class ChurchLoginBloc extends Bloc<ChurchLoginEvent, ChurchLoginState> {
  String? accountID;

  ChurchLoginBloc() : super(ChurchLoginInitial()) {
    // AccountId Change
    on<OnAccountIDFieldChange>((event, emit) {
      try {
        accountID = event.accountID!;
      } catch (e) {
        if (kDebugMode) print('Emiting Error: $e');
      }
    });

    on<OnSubmittedChangeEvent>((event, emit) async {
      try {
        emit(ChurchLoginLoading());
        String cid = accountID!;

        final resStatus = await Api.getChurchId(cid);
        final statusCode = int.parse(resStatus[0]!);
        if (statusCode == 201) {
          emit(ChurchLoginSubmitted(accountId: resStatus[1]));
        } else {
          emit(ChurchLoginInitial());
        }
      } catch (e) {
        if (kDebugMode) {
          emit(ChurchLoginInitial());
          print('Emiting error: $e');
        }
      }
    });

    on<CreateChurchAccount>((event, emit) {
      try {
        emit(ChurchLoginCreateChurch());
      } catch (e) {
        if (kDebugMode) print('Emiting error: $e');
        emit(ChurchLoginInitial());
      }
    });
  }
}
