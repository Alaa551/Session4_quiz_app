

class ListTileRadioModel {
  String title;
  int groupValue;
  int value;
  Function(int) onChanged;

  ListTileRadioModel(
      {required this.title,
        required this.groupValue,
        required this.value,
        required this.onChanged
      });
}
