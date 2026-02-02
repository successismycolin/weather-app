import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

import '../data/my_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final String? API_KEY = dotenv.env['WEATHER_API_KEY'];

  WeatherBloc() : super(WeatherBlocInitial()) {
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

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        // Position position = await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude,
        );
        emit(WeatherBlocSuccess(weather));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
