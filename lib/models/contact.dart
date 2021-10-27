class Contact {
  //final int id;
  final String name;
  final String account;
  Contact({
    //required this.id,
    required this.name,
    required this.account,
  });

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'name': name,
      'account': account,
    };
  }

  @override
  String toString() => 'Contact(name: $name, account: $account)';
}
