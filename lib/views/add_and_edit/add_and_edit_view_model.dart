import 'package:calendar/core/base/base_view_model.dart';
import 'package:calendar/core/models/document.dart';

class AddAndEditViewModel extends BaseViewModel {
  AddAndEditViewModel();

  Document _edittingDocument;

  bool get _editting => _edittingDocument != null;

  void setEdittingDocument(Document edittingDocument) {
    _edittingDocument = edittingDocument;
  }
  
  // Add ViewModel specific code here
}