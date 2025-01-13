part of 'handle_pdf_bloc.dart';

sealed class HandlePdfState extends Equatable {
  const HandlePdfState();

  @override
  List<Object> get props => [];
}

final class HandlePdfInitial extends HandlePdfState {}

final class HandlePdfLoading extends HandlePdfState {}

final class HandlePdfOpenSuccess extends HandlePdfState {}
