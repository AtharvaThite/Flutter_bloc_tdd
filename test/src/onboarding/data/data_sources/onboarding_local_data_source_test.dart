import 'package:flutter_bloc_tdd/core/errors/exceptions.dart';
import 'package:flutter_bloc_tdd/src/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences prefs;
  late OnboardingLocalDataSource localDataSource;

  setUp(() {
    prefs = MockSharedPreferences();
    localDataSource = OnboardingLocalDataSrcImpl(prefs);
  });

  group('cacheFirstTimer', () {
    test('Should call [SharedPreferences] to cache the data', () async {
      when(() => prefs.setBool(any(), any())).thenAnswer((_) async => true);

      await localDataSource.cacheFirstTimer();

      verify(() => prefs.setBool(kFirstTimerKey, false)).called(1);

      verifyNoMoreInteractions(prefs);
    });

    test('Should throw a [CacheException] when an error occurs', () async {
      when(
        () => prefs.setBool(any(), any()),
      ).thenThrow(Exception());

      final methodCall = localDataSource.cacheFirstTimer();

      expect(methodCall, throwsA(isA<CacheException>()));
      verify(
        () => prefs.setBool(kFirstTimerKey, false),
      ).called(1);

      verifyNoMoreInteractions(prefs);
    });
  });

  group('userIsFirstTimer', () {
    test(
      'Should call [SharedPreferences] to check if user is first timer '
      'return right responsefrom storage when data exist',
      () async {
        when(() => prefs.getBool(any())).thenReturn(false);
        final result = await localDataSource.checkIfUserIsFirstTimer();
        expect(result, false);
        verify(() => prefs.getBool(kFirstTimerKey)).called(1);
        verifyNoMoreInteractions(prefs);
      },
    );

    test('Should return true when there no data in storage', () async {
      when(() => prefs.getBool(any())).thenReturn(null);
      final result = await localDataSource.checkIfUserIsFirstTimer();
      expect(result, true);
      verify(() => prefs.getBool(kFirstTimerKey)).called(1);
      verifyNoMoreInteractions(prefs);
    });

    test('Should throw a [CacheException] when there is a error', () async {
      when(() => prefs.getBool(any())).thenThrow(Exception());
      final call = localDataSource.checkIfUserIsFirstTimer();
      expect(call, throwsA(isA<CacheException>()));
      verify(() => prefs.getBool(kFirstTimerKey)).called(1);
      verifyNoMoreInteractions(prefs);
    });
  });
}
