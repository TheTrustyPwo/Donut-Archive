class Token {
  String token;

  Token(this.token);

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(json['token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
