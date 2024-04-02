import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_part1/cubits/countries/countries_state.dart';
import 'package:block_part1/data/models/countries_model.dart';
import 'package:block_part1/data/network/api_provider.dart';
import 'package:block_part1/data/response/my_response.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesState(countries: []));

  List<CountriesModel> countries = [];

  fetchData() async {
    MyResponse myResponse = await ApiProvider.fetchCountry();
    countries = myResponse.data as List<CountriesModel>;
    emit(state.copyWith(countries: countries));
  }
}
