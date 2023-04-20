import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valyuta_kurs/pages/block/main_bloc.dart';
import 'package:valyuta_kurs/pages/block/main_event.dart';
import 'package:valyuta_kurs/pages/block/main_state.dart';
import 'package:valyuta_kurs/pages/splash_page.dart';

import '../widget/itemWidget.dart';

class HomePage extends StatefulWidget {
  static const route = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent.shade700,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )),
          title: const Text(
            "Valyuta",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          actions: [
            InkWell(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(
                    Duration(days: 30),
                  ),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  bloc.add(MainGetDateEvent(date));
                }
              },
              child: const Icon(
                Icons.calendar_month,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    isDismissible: false,
                    isScrollControlled: true,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    height: 13,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade300),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  RadioListTile<int>(
                                      title: Text("O'zbekcha"),
                                      value: 1,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() => _selectedValue = value!);
                                        context.setLocale(Locale("uz", "UZ"));
                                      }),
                                  RadioListTile<int>(
                                      title: Text("Узбекча"),
                                      value: 2,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() => _selectedValue = value!);
                                        context.setLocale(Locale("uz", "UZ"));
                                      }),
                                  RadioListTile<int>(
                                      title: Text("Русский"),
                                      value: 3,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() => _selectedValue = value!);
                                        context.setLocale(Locale("uz", "UZ"));
                                      }),
                                  RadioListTile<int>(
                                      title: Text("English"),
                                      value: 4,
                                      groupValue: _selectedValue,
                                      onChanged: (int? value) {
                                        setState(() => _selectedValue = value!);
                                        context.setLocale(Locale("uz", "UZ"));
                                      }),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                    });
              },
              child: const Icon(
                Icons.g_translate_outlined,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: Builder(
          builder: (context) {
            if (state.status == Status.loading) {
              return const Center(child: SplashPage());
            }
            return ListView.separated(
                itemBuilder: (_, i) {
                  final model = state.currencies[i].tr(context.locale);
                  return ItemWidget(model: model);
                },
                separatorBuilder: (_, i) => const SizedBox(
                      height: 1,
                    ),
                itemCount: state.currencies.length);
          },
        ),
      );
    });
  }
}
