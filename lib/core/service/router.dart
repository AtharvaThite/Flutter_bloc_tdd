import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tdd/core/common/views/page_under_construction.dart';
import 'package:flutter_bloc_tdd/core/extensions/context_extension.dart';
import 'package:flutter_bloc_tdd/core/service/injection_container.dart';
import 'package:flutter_bloc_tdd/src/auth/data/models/user_model.dart';
import 'package:flutter_bloc_tdd/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc_tdd/src/auth/presentation/views/forgot_password_screen.dart';
import 'package:flutter_bloc_tdd/src/auth/presentation/views/sign_in_screen.dart';
import 'package:flutter_bloc_tdd/src/auth/presentation/views/sign_up_screen.dart';
import 'package:flutter_bloc_tdd/src/dashboard/presentation/views/dashboard.dart';
import 'package:flutter_bloc_tdd/src/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:flutter_bloc_tdd/src/onboarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:flutter_bloc_tdd/src/onboarding/presentation/views/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'router_main.dart';
