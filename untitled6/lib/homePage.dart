import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/anasayfaCubit.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astronot İletişim'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: context.read<AnasayfaCubit>().astronot.length,
              itemBuilder: (context, index) {
                final astronaut = context.read<AnasayfaCubit>().astronot[index];
                return ListTile(
                  title: Text(astronaut),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final messageController = TextEditingController();
                        return AlertDialog(
                          title: Text("Mesaj Gönder"),
                          content: TextField(
                            controller: messageController,
                            decoration: InputDecoration(
                              hintText: "Mesajınızı yazın",
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AnasayfaCubit>()
                                    .sendMessage(astronaut, messageController.text);
                                Navigator.pop(context);
                              },
                              child: Text("Gönder"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: BlocBuilder<AnasayfaCubit, List<String>>(
              builder: (context, messages) {
                if (messages.isEmpty) {
                  return Center(child: Text("Henüz mesaj yok!"));
                }
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(messages[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
