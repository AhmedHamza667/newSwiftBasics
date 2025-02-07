//: [Previous](@previous)

import Foundation

protocol Account: AnyObject{ // main protocol for bank account
    var accountNumber: Int { get }
    var routingNumber: Int { get }
    var transactionHistory: [Transaction] { get set }
    var balance: Double { get set }
    func transfer(to: Account, amount: Double)
}

protocol CheckingAccount: Account{
    var overdraftLimit: Double { get set }
}
protocol SavingsAccount: Account{
    var interestRate: Double { get set }
}


class ClientChecking: CheckingAccount, Account{
    var accountNumber: Int
    var routingNumber: Int
    var transactionHistory: [Transaction] = []
    var overdraftLimit: Double = -50.00
    var balance: Double = 0
    init(balance: Double) {
        self.accountNumber = Int.random(in: 1000000000...9999999999)
        self.routingNumber = Int.random(in: 100000000...999999999)
        self.balance = balance
        print("Checking account created with initial balance of \(balance)")
    }
    func deposit(amount: Double) {
        balance += amount
    }
    func withdraw(amount: Double) {
        if amount < balance { // if there's enough money
            balance -= amount
        } else {
            print("You don't have enough funds")
        }
    }
    func showBalance() {
        print("Your current balance is: \(balance)")
    }
    func addTransaction(transaction: Transaction) {
        transactionHistory.append(transaction)
        balance -= transaction.amount ?? 0
        if balance < overdraftLimit {
            print("You have been overdrafted, and charged a $25 fee. Please deposit funds ASAP.")
            balance -= 25
        }
    }
    func removeTransaction(index: Int) {
        print("\(self.transactionHistory[index].spentOn ?? "Unkown Item") removed from transaction history.")
        balance += self.transactionHistory[index].amount ?? 0
        transactionHistory.remove(at: index)
    }
    func showTransactionHistory() {
        if transactionHistory.isEmpty {
            return
        }
        print("Transaction History:")
        for transaction in transactionHistory {
            print("\(transaction.spentOn ?? "Unkown Item"), $\(transaction.amount ?? 0) on \(transaction.date ?? "Unknown Date")")
        }
    }
    
    func transfer(to: Account, amount: Double){
        if self.balance < amount{
            print("Account does not have enough funds")
            return
        }
        self.balance -= amount
        to.balance += amount
        print("An amount of \(amount) has been transfered successfully")
    }

}
class ClientSavings: SavingsAccount, Account{
    var accountNumber: Int
    var routingNumber: Int
    var transactionHistory: [Transaction] = []
    var interestRate: Double = 0.05 // 5% annual interst
    var balance: Double
    init(balance: Double) {
        self.accountNumber = Int.random(in: 1000000000...9999999999)
        self.routingNumber = Int.random(in: 100000000...999999999)
        self.balance = balance
        print("Saving account created with initial balance of \(balance)")
    }
    func deposit(amount: Double) {
        balance += amount
    }
    func withdraw(amount: Double) {
        if amount < balance { // if there's enough money
            balance -= amount
        } else {
            print("You don't have enough funds")
        }
    }
    func showBalance() {
        print("Your current balance is: \(balance)")
    }
    func addYearlyInterest() {
        balance += balance * interestRate
        print("Your balance has increased by \(balance * interestRate)")
    }
    func transfer(to: Account, amount: Double){
        if self.balance < amount{
            print("Account does not have enough funds")
            return
        }
        self.balance -= amount
        to.balance += amount
        print("An amount of \(amount) has been transfered successfully")
    }

}
class Transaction{
    var amount: Double?
    var spentOn: String?
    var date: String?
    init(amount: Double? = nil, spentOn: String? = nil, date: String? = nil) {
        self.amount = amount
        self.spentOn = spentOn
        self.date = date
    }
}
// test for checking account
//var account1 = ClientChecking(balance: 100) // initailize checking acc with $100
//account1.deposit(amount: 100) // deposite another $100 balance = 200.0
//account1.showBalance() // 200
//account1.withdraw(amount: 50) // 200.23 - 50 = 150.0
//account1.showBalance() // 150.0
//account1.addTransaction(transaction: Transaction(amount: 50, spentOn: "Groceries", date: "02/05/2025")) // 150 - 20 = 100
//account1.showBalance() // 100
//account1.addTransaction(transaction: Transaction(amount: 12, spentOn: "Travel", date: "02/01/2025")) // 100 - 12 = 88
//account1.addTransaction(transaction: Transaction(amount: 100, spentOn: "Lunch", date: "01/29/2025")) // 88 - 100 = -12 (not overdrafted yet)
//account1.showBalance()
//account1.addTransaction(transaction: Transaction(amount: 40, spentOn: "Gym", date: "01/11/2025")) // -12 - 40 = -52 !!!Overdraft fee $25 balance is now -77
//
//account1.showBalance()
//account1.deposit(amount: 200) // deposit 200
//account1.showBalance() //  -77 + 200 = 123
//account1.withdraw(amount: 200) // trying to withdraw 200 but no funds
//account1.showBalance() // balance is still 123
//print(account1.showTransactionHistory())
//account1.removeTransaction(index: 0) // removing first trans of $50
//account1.showBalance() // 123 + 50 = 173

// example for saving account
var savingAccount1 = ClientSavings(balance: 100)
savingAccount1.deposit(amount: 1250) // 100+ 1250 = 1350
savingAccount1.showBalance()
savingAccount1.addYearlyInterest() // added 5% interst
savingAccount1.showBalance()

var savingAccount2 = ClientSavings(balance: 500) // new Saving Account with $500
savingAccount1.transfer(to: savingAccount2, amount: 1500) // not enough funds
savingAccount1.transfer(to: savingAccount2, amount: 1000)
// now acc1 has $417 and acc2 has $1500
savingAccount1.showBalance()
savingAccount2.showBalance()

