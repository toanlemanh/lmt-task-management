class FormValidation {
  String? error;
  String? processedText;
  bool validateText(String value){
    if (value.trim().isEmpty) {
      error = 'Detail cannot be empty';
      return false;
    }
    processedText = value.trim();
    error = null;
    return true;
  }
}