class Contact {
  final String name;
  final String accountNumber;
  Contact({
    required this.name,
    required this.accountNumber,
  });

  @override
  String toString() => 'Contact(name: $name, accountNumber: $accountNumber)';
}
