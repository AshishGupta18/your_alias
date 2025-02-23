import 'package:get_it/get_it.dart';
import 'package:your_alias/features/meditation/data/datasources/meditation_remote_datasource.dart';
import 'package:your_alias/features/meditation/data/repositories/meditation_repository_impl.dart';
import 'package:your_alias/features/meditation/domain/repositories/meditation_repository.dart';
import 'package:your_alias/features/meditation/domain/usecases/get_daily_quote.dart';
import 'package:your_alias/features/meditation/domain/usecases/get_mood_message.dart';
import 'package:your_alias/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:your_alias/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
import 'package:your_alias/features/music/data/datasources/song_remote_datasource.dart';
import 'package:your_alias/features/music/data/repositories/song_repository_impl.dart';
import 'package:your_alias/features/music/domain/repositories/song_repository.dart';
import 'package:your_alias/features/music/domain/usecases/get_all_songs.dart';
import 'package:your_alias/features/music/presentation/bloc/song_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // blocs
  sl.registerFactory(() => DailyQuoteBloc(getDailyQuote: sl()));
  sl.registerFactory(() => MoodMessageBloc(getMoodMessage: sl()));
  sl.registerFactory(() => SongBloc(getAllSongs: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetDailyQuote(repository: sl()));
  sl.registerLazySingleton(() => GetMoodMessage(repository: sl()));
  sl.registerLazySingleton(() => GetAllSongs(repository: sl()));

  // Repositories
  sl.registerLazySingleton<MeditationRepository>(
          () => MeditationRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<SongRepository>(
          () => SongRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<MeditationRemoteDataSource>(
          () => MeditationRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SongRemoteDataSource>(
          () => SongRemoteDataSourceImpl(client: sl()));

  //
  sl.registerLazySingleton(() => http.Client());
}