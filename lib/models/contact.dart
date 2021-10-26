class Contact {
  final int id;
  final String name;
  final String accountNumber;
  Contact({
    required this.id,
    required this.name,
    required this.accountNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'accountNumber': accountNumber,
    };
  }

  @override
  String toString() => 'Contact(name: $name, accountNumber: $accountNumber)';
}
