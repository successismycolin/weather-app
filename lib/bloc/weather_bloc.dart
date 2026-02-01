import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

import '../data/my_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final String? API_KEY = dotenv.env['WEATHER_API_KEY'];

  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      // TODO: implement event handler
      emit(WeatherBlocLoading());
      try {
        final apiKey = API_KEY;
        if (apiKey == null || apiKey.isEmpty) {
          // Environment key missing - handle gracefully
          emit(WeatherBlocFailure());
          return;
        }

        WeatherFactory wf = WeatherFactory(apiKey, language: Language.ENGLISH);
        Position position = await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
            position.latitude,
            position.longitude,
        );
        emit(WeatherBlocSuccess(weather));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
