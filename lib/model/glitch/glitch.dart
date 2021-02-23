class Glitch{
  String message;
  Glitch({this.message});

  @override
  String toString() =>'Glitch: (message: $message)';


  @override
  bool operator ==(Object other) {
    if(identical(this, other))
      return true;

    return other is Glitch && other.message == message;
  }

  @override
  int get hashcode => message.hashCode;
}