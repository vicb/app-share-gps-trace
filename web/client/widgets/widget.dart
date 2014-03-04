
import "dart:html";
import "loading.dart" ;

class Widget{
  
  String _id ;
  LoadingShower _loadingShower ;

  int top;
  int right;
  int width;
  int height;
  
  Widget(this._id);
  
  String get id => _id;
  
  void updatePosition(int top, int right, int width, int height){
    this.top= top;
    this.right = right;
    this.width = width;
    this.height = height;
    
    querySelectorAll("#${id}").forEach((e){
      Element element = e as Element ;
      element.style.height = "${height}px" ;
      element.style.width = "${width}px" ;
      element.style.top = "${top}px" ;
      element.style.right = "${right}px" ;
    });
    
  }
  
  void startLoading(){
    if (_loadingShower != null){
      _loadingShower.startLoading();
    }
  }

  void stopLoading(){
    if (_loadingShower != null){
      _loadingShower.stopLoading();
    }
  }
  
  void set loadingShower (LoadingShower loadingShower){
    this._loadingShower = loadingShower;
  }
}
