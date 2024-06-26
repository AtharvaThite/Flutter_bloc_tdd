import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc_tdd/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_bloc_tdd/src/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/usecases/forgot_password.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/usecases/sign_in.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/usecases/sign_up.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/usecases/update_user.dart';
import 'package:flutter_bloc_tdd/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc_tdd/src/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:flutter_bloc_tdd/src/onboarding/data/repos/onboarding_repo_impl.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:flutter_bloc_tdd/src/onboarding/domain/usecases/user_is_first_timer.dart';
import 'package:flutter_bloc_tdd/src/onboarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container_main.dart';
