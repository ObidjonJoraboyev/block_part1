import '../../data/models/countries_model.dart';

class CountriesState {
  final List<CountriesModel> countries;

  CountriesState({
    required this.countries,
  });

  CountriesState copyWith({List<CountriesModel>? countries}) {
    return CountriesState(countries: countries ?? this.countries);
  }
}
