import 'package:hive/hive.dart';

part 'listBox.g.dart';

@HiveType(typeId: 4)
class ListBox {
  @HiveField(0)
  List<bool> selectedList = [];

  ListBox({
    required this.selectedList,
  });
}
