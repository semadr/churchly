part of 'handle_pdf_bloc.dart';

sealed class HandlePdfEvent extends Equatable {
  const HandlePdfEvent();

  @override
  List<Object> get props => [];
}

final class OnHandlePdfOpenEvent extends HandlePdfEvent {
  final BuildContext? context;

  const OnHandlePdfOpenEvent({required this.context});

  @override
  List<Object> get props => [context!];
}
