part of 'weather_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();
}

class FetchWeather extends WeatherBlocEvent {

}
