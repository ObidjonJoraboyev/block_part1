import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_part1/cubits/countries/countries_cubit.dart';
import 'package:block_part1/data/models/countries_model.dart';
import '../../cubits/countries/countries_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Countries",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(.5),
      ),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state.countries.isNotEmpty) {
            return Scrollbar(
              thickness: 8,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ...List.generate(
                    state.countries.length,
                    (index) {
                      List<CountriesModel> list = state.countries;
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            title: Text(
                              list[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            trailing: Text(
                              list[index].emoji,
                              style: const TextStyle(fontSize: 24),
                            ),
                            subtitle: Text(
                              list[index].continent.name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            leading: SizedBox(
                              width: 50,
                              child: Text(
                                "+${list[index].phone.split(",")[0]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 0.9,
                            color: Colors.black.withOpacity(.23),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
