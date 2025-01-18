import 'dart:io';

import 'package:churchly/src/churchly/presentation/providers/pdf/save_and_open_pdf.dart';
import 'package:churchly/src/churchly/presentation/providers/pdf/table_pdf_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'handle_pdf_event.dart';
part 'handle_pdf_state.dart';

class HandlePdfBloc extends Bloc<HandlePdfEvent, HandlePdfState> {
  HandlePdfBloc() : super(HandlePdfInitial()) {
    // First Line of Events
    on<OnHandlePdfOpenEvent>((event, emit) async {
      try {
        emit(HandlePdfLoading());
        final tablePdf = await TablePdfApi.generateTablePdf(event.context);

        emit(HandlePdfOpenSuccess(tablePdf: tablePdf));
        SaveAndOpenDocument.openPdf(tablePdf);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }
}
