import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/user.dart'; // Import User, Wallet, BankAccount classes

void main() {
  group('User, Wallet, and Payment Tests', () {
    late User user;
    late Wallet wallet;

    setUp(() {
      user = User('Rakib', 25);
      wallet = Wallet(user);
    });

    test('User is adult', () {
      expect(user.isAdult(), true);
    });

    test('User is underage', () {
      var underageUser = User('Alice', 16);
      expect(underageUser.isAdult(), false);
    });

    test('User can register', () {
      expect(user.register(), true);
    });

    test('Add bank account to wallet', () {
      var bankAccount = BankAccount('123456789', 'Ashikur Jaman Rakib', 'BankX');
      bankAccount.deposit(500); // Simulating depositing 500tk
      wallet.addBankAccount(bankAccount);
      expect(wallet.bankAccounts.contains(bankAccount), true);
    });

    test('Request money from wallet', () {
      var bankAccount = BankAccount('123456789', 'Ashikur Jaman Rakib', 'BankX');
      wallet.addBankAccount(bankAccount);
      var request = wallet.requestMoney(50, 'For groceries');
      expect(request.status, 'Pending');
    });

    test('Check balance in wallet', () {
      var bankAccount = BankAccount('123456789', 'Ashikur Jaman Rakib', 'BankX');
      bankAccount.deposit(500); // Simulating depositing 500tk
      wallet.addBankAccount(bankAccount);
      var balance = wallet.checkBalance();
      expect(balance, 500); // Asserting that the balance is 500tk
    });

    test('Make payment from wallet', () {
      var bankAccount = BankAccount('123456789', 'Ashikur Jaman Rakib', 'BankX');
      bankAccount.deposit(500); // Simulating depositing 500tk
      wallet.addBankAccount(bankAccount);
      
      var paymentStatus = wallet.makePayment(300, 'For shopping');
      expect(paymentStatus, true); // Asserting that the payment is successful
    });

 
}