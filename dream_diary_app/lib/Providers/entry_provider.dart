import 'package:flutter/material.dart';
import 'package:dream_diary_app/Models/entry.dart';

class EntryProvider extends ChangeNotifier {
  List<Entry> _entries = [];

  List<Entry> get entries => _entries;

  void addEntry(Entry newEntry) {
    _entries.add(newEntry);
    notifyListeners();
  }

  void notifyNewEntry() {
    notifyListeners();
  }

  void editEntry(Entry newEntry) {
    final index = _entries.indexWhere((entry) => entry.id == newEntry.id);
    if (index != -1) {
      _entries[index] = newEntry;
      notifyListeners();
    } else {
      print('Entry with id ${newEntry.id} not found.');
    }
  }

  void notifyUpdatedEntry(updatedEntry) {
    notifyListeners();
  }

  void removeEntry(String entryId) {
    _entries.removeWhere((entry) => entry.id == entryId);
    notifyListeners();
  }
}
