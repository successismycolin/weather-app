part of 'weather_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();
}

class FetchWeather extends WeatherBlocEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
