import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/presentation/views/root/cubit/root_view_cubit.dart';

part 'root_view_mixin.dart';

/// [RootView] is shown to the user after the user has logged in
@RoutePage()
class RootView extends StatefulWidget {
  /// [RootView] constructor
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView>
    with RootViewMixin, FunctionDurationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootViewCubit>(
      create: (_) => RootViewCubit(),
      child: const Scaffold(
        body: Center(
          child: Text('RootView'),
        ),
      ),
    );
  }
}
