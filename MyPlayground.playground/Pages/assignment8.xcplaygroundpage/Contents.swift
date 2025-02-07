import Foundation

protocol Account: AnyObject {
    var balance: Double { get set }
    var accountNumber: Int { get }
    var routingNumber: Int { get }
    var transactionHistory: [Transaction] { get set }
    func deposit(amount: Double)
    func withdraw(amount: Double)
    func transfer(to: Account, amount: Double)
    func showBalance()
}

protocol CheckingAccount: Account {
    var overdraftLimit: Double { get set }
}

protocol SavingsAccount: Account {
    var interestRate: Double { get set }
}

enum TransactionType {
    case deposit(amount: Double)
    case withdrawal(amount: Double)
    case transfer(to: Account, amount: Double)
    case interest(amount: Double)
    var label: String {
        switch self {
        case .deposit:
            return "Deposit"
        case .withdrawal:
            return "Withdrawal"
        case .transfer:
            return "Transfer"
        case .interest:
            return "Interest"
        }
    }
}

struct Transaction {
    let type: TransactionType
    let date: Date
    var amount: Double
}

class BankAccount: CheckingAccount {
    var accountNumber: Int
    var routingNumber: Int
    var transactionHistory: [Transaction] = []
    var overdraftLimit: Double = -50.00
    var balance: Double = 0
    
    init(balance: Double) {
        self.accountNumber = Int.random(in: 1000000000...9999999999)
        self.routingNumber = Int.random(in: 100000000...999999999)
        self.balance = balance
        print("Account created with initial balance of \(balance)")
    }

    func deposit(amount: Double) {
        balance += amount
        transactionHistory.append(Transaction(type: .deposit(amount: amount), date: Date(), amount: amount))
    }
    
    func withdraw(amount: Double) {
        guard balance >= amount else {
            print("Insufficient funds.")
            return
        }
        balance -= amount
        transactionHistory.append(Transaction(type: .withdrawal(amount: amount), date: Date(), amount: amount))
    }
    
    func showBalance() {
        print("Your current balance is: \(balance)")
    }
    
    func addTransaction(transaction: Transaction) {
        transactionHistory.append(transaction)
        balance -= transaction.amount
        if balance < overdraftLimit {
            print("You have been overdrafted, and charged a $25 fee. Please deposit funds ASAP.")
            balance -= 25
        }
    }
    
    func showTransactionHistory() {
        if transactionHistory.isEmpty {
            print("No transactions found.")
            return
        }
        print("Transaction History for Account \(accountNumber):")
        for transaction in transactionHistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-DD-yyyy HH:mm:ss"
                    let formattedDate = dateFormatter.string(from: transaction.date)
                    print("\(transaction.type.label) - Amount: \(transaction.amount), Date: \(formattedDate)")
                }
    }
    
    func transfer(to: Account, amount: Double) {
        if self.balance < amount {
            print("Account does not have enough funds")
            return
        }
        self.balance -= amount
        to.balance += amount
        print("An amount of \(amount) has been transferred successfully")
    }
}

class ClientSavings: BankAccount, SavingsAccount {
    var interestRate: Double = 0.05 // 5% annual interest

    func addYearlyInterest() {
        let interest = balance * interestRate
        balance += interest
        print("Your balance has increased by \(interest) due to interest.")
        transactionHistory.append(Transaction(type: .interest(amount: interest), date: Date(), amount: interest))
    }
}

class Bank {
    private var accounts: [BankAccount] = []
    
    func addAccount(_ account: BankAccount) {
        accounts.append(account)
    }
    
    func getAccount(index: Int) -> BankAccount? {
        guard index < accounts.count else { return nil }
        return accounts[index]
    }
    
    func totalBalance() -> Double {
        return accounts.reduce(0) { $0 + $1.balance }
    }
}

// Test cases for Checking Account
var account1 = BankAccount(balance: 100) // Initialize checking account with $100
account1.deposit(amount: 100) // Deposit another $100 balance = 200.0
account1.showBalance() // 200
account1.withdraw(amount: 50) // 200 - 50 = 150.0
account1.showBalance() // 150.0
account1.withdraw(amount: 50) // 150 - 50 = 100
account1.showBalance() // 100
account1.withdraw(amount: 12) // 100 - 12 = 88
account1.showBalance() // 88
account1.withdraw(amount: 100) // 88 - 100 = -12 not enought funds
account1.showBalance() // 88
//
//account1.withdraw(amount: 40) // -12 - 40 = -52 (+ Overdraft fee of $25 applied)
//account1.showBalance() // -52 - 25 = 77
//account1.deposit(amount: 200) // Deposit 200
//account1.showBalance() // 200 - 77 = 123
//account1.withdraw(amount: 200) // Trying to withdraw 200 but no funds
//account1.showBalance() // Still 123
//
//account1.showTransactionHistory()
//
//// Test for Saving Account
//var savingAccount1 = ClientSavings(balance: 1000)
//savingAccount1.addYearlyInterest() // Added 5% interest
//savingAccount1.showBalance()
//
//// Trying to transfer between saving accounts
//var savingAccount2 = ClientSavings(balance: 500)
//savingAccount1.transfer(to: savingAccount2, amount: 2000) // Unsuccessful transfer
//savingAccount1.transfer(to: savingAccount2, amount: 200) // Successful transfer
//savingAccount1.showBalance() // 1050 - 200 = 850
//savingAccount2.showBalance() // 500 + 200 = 700
