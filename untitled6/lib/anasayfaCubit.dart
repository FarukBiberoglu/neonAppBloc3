import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<String>> {
  AnasayfaCubit() : super([]);

  List<String> astronot = ['Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin'];

  void sendMessage(String astronot, String message) {
    final updatedMessages = List<String>.from(state);
    updatedMessages.add('$astronot\'a mesaj gönderildi: $message');

    emit(updatedMessages);
  }
}
