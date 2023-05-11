import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_paper/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('r-p-s game'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ApiService>(
                builder: (context, apiService, child) {
                  if (apiService.data == null) {
                    return const CircularProgressIndicator();
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text('You:: '),
                            Text(
                              apiService.data['result']
                                  .toString()
                                  .toUpperCase(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text(' The computer choose ::'),
                            Text(
                              apiService.data['server_move']
                                  .toString()
                                  .toUpperCase(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        )
                      ],
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: TextField(
                controller: textEditingController,
              ),
            ),
            Expanded(
                child: Consumer<ApiService>(
              builder: (context, apiService, child) => TextButton(
                onPressed: () => apiService.postData(
                  {"move": textEditingController.text},
                ),
                child: const Text('Submit'),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
