import 'package:churchly/src/churchly/presentation/bloc/church_finance/church_finance_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_info/church_info_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_login/church_login_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/handle_pdf/handle_pdf_bloc.dart';
import 'package:churchly/src/churchly/presentation/screens/responsive/finance_view.dart';
import 'package:churchly/src/churchly/presentation/screens/responsive/login_view.dart';
import 'package:churchly/src/churchly/presentation/screens/responsive/mobile_view.dart';
import 'package:churchly/src/churchly/presentation/screens/responsive/responsive.dart';
import 'package:churchly/src/churchly/presentation/screens/responsive/tablet_view.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChurchLoginBloc, ChurchLoginState>(
        builder: (context, state) {
      if (state is ChurchLoginSubmitted) {
        return BlocBuilder<ChurchFinanceBloc, ChurchFinanceState>(
          builder: (context, fstate) {
            if (fstate is ChurchFinanceLoading) {
              return const LoadingView();
            } else if (fstate is ChurchFinanceCreateSuceeded) {
              return FinanceView(accountId: state.accountId);
            } else {
              return BlocBuilder<HandlePdfBloc, HandlePdfState>(
                builder: (context, pstate) {
                  if (pstate is HandlePdfOpenSuccess) {
                    // SaveAndOpenDocument.openPdf(pstate.tablePdf!);
                    return FinanceView(accountId: state.accountId);
                  } else if (pstate is HandlePdfLoading) {
                    return const LoadingView();
                  } else {
                    return FinanceView(accountId: state.accountId);
                  }
                },
              );
            }
          },
        );
      } else if (state is ChurchLoginCreateChurch) {
        return BlocBuilder<ChurchInfoBloc, ChurchInfoState>(
          builder: (context, state) {
            if (state is ChurchInfoSubmitted) {
              return FinanceView(
                accountId: state.accountId,
              );
            } else if (state is ChurchInfoLoading) {
              return const LoadingView();
            } else {
              return const Responsive(
                mobileView: MobileView(),
                tabletView: TabletView(),
              );
            }
          },
        );
      } else if (state is ChurchLoginLoading) {
        return const LoadingView();
      } else {
        return const LoginView();
      }
    });
  }
}
