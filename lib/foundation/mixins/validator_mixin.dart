mixin ValidatorMixin {
  String? taskTitleValidator(text) {
    if (text!.isEmpty) {
      return 'Title can\'t be empty!';
    }
    return null;
  }
}