import 'package:flutter/material.dart';
import 'package:pretest/model/list_model.dart';
import 'package:pretest/services/services.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController controller;

  // data
  ListModel? data;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// For get search result from API
  Future searchById() async {
    String id = controller.text;

    var res = await Services.getListById(id);

    setState(() {
      data = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pencarian'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Cari berdasarkan id',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  searchById();
                },
                child: const Text('Cari'),
              ),
            ],
          ),
          Expanded(
            child: (data == null) // check if data is not null
                ? const Center(
                    child: Text('Tidak ada data'),
                  )
                : Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data!.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(data!.body),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
