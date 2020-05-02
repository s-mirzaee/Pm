class sliderValue{
  static List<double> values=[];



  void create(int n){
    values.clear();
    for(int i=0;i<n;i++){

      values.add(0);
    }
  }
  double getValue(int n){
    return values[n];
  }
  void setValue(int i,double value){
    values[i]=value;
  }
  List<double> getAllValues(){
    return values;
  }

}