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
    case overdraftFee(amount: Double)
    var amount: Double? { // computed property
            switch self {
            case .deposit(let amount),
                 .withdrawal(let amount),
                 .transfer(_, let amount),
                 .overdraftFee(let amount),
                 .interest(let amount):
                return amount
            }
        }

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
        case .overdraftFee:
            return "Overdraft Fee"
        }
    }
}

struct Transaction {
    let type: TransactionType
    let date: Date
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
        transactionHistory.append(Transaction(type: .deposit(amount: amount), date: Date()))
    }
    
    func withdraw(amount: Double) {
        guard balance >= amount else {
            print("Insufficient funds.")
            return
        }
        balance -= amount
        transactionHistory.append(Transaction(type: .withdrawal(amount: amount), date: Date()))
    }
    
    func showBalance() {
        print("Your current balance is: \(balance)")
    }
    
    func addTransaction(transaction: Transaction) {
        transactionHistory.append(transaction)
        
        switch transaction.type {
        case .deposit(let amount):
            balance += amount
        case .withdrawal(let amount):
            balance -= amount
        case .transfer(_, let amount):
            balance -= amount
        case .interest(let amount):
            balance += amount
        case .overdraftFee(let amount):
            balance -= amount
        }
        
        // Check if the balance has fallen below the overdraft limit
        if balance < overdraftLimit {
            print("You have been overdrafted, and charged a $25 fee. Please deposit funds ASAP.")
            
            let overdraftTransaction = Transaction(type: .overdraftFee(amount: 25.00), date: Date())
            transactionHistory.append(overdraftTransaction)
            
            balance -= 25.00
        }
    }

    func showTransactionHistory() {
        if transactionHistory.isEmpty {
            print("No transactions found.")
            return
        }
        print("=========================")
        print("Transaction History for Account \(accountNumber):")
        for transaction in transactionHistory {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-DD-yyyy HH:mm:ss"
                    let formattedDate = dateFormatter.string(from: transaction.date)
                    let amountText = transaction.type.amount.map { String(format: "%.2f", $0) } ?? "N/A"

                    print("\(transaction.type.label) - Amount: \(amountText), Date: \(formattedDate)")
                }
    }
    
    func transfer(to: Account, amount: Double) {
        if self.balance - amount < overdraftLimit {
            print("Insufficient funds for transfer.")
            return
        }
        self.balance -= amount
        to.balance += amount

        let transferOut = Transaction(type: .transfer(to: to, amount: amount), date: Date())
        let transferIn = Transaction(type: .deposit(amount: amount), date: Date())

        self.transactionHistory.append(transferOut)
        to.transactionHistory.append(transferIn)

        print("Transferred \(amount) to account \(to.accountNumber).")
    }
}

class ClientSavings: BankAccount, SavingsAccount {
    var interestRate: Double = 0.05 // 5% annual interest

    func addYearlyInterest() {
        let interest = balance * interestRate
        //balance += interest
        print("Your balance has increased by \(interest) due to interest.")
//        transactionHistory.append(Transaction(type: .interest(amount: interest), date: Date()))
        addTransaction(transaction: Transaction(type: .interest(amount: interest), date: Date()))
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
//var account1 = BankAccount(balance: 100) // Initialize checking account with $100
//account1.addTransaction(transaction: Transaction(type: .deposit(amount: 100), date: Date())) // Deposit another $100 balance = 200.0
//account1.showBalance() // 200
//account1.addTransaction(transaction: Transaction(type: .withdrawal(amount: 50), date: Date())) // 200 - 50 = 150.0
//account1.showBalance() // 150.0
//account1.addTransaction(transaction: Transaction(type: .withdrawal(amount: 150), date: Date())) // 150 - 150 = 0
//account1.showBalance() // 100
//account1.addTransaction(transaction: Transaction(type: .withdrawal(amount: 12), date: Date())) // 0 - 12 = -12
//account1.showBalance() // -12 not overdrafted yet
//account1.addTransaction(transaction: Transaction(type: .withdrawal(amount: 50), date: Date())) // -12 - 50 = -62 (Overdrafted! and a fee of $25 has been applied)
//account1.showBalance() // -62 - 25 = -87
//account1.showTransactionHistory()

// Test for Saving Account
var savingAccount1 = ClientSavings(balance: 1000) // 1000 in account
savingAccount1.addYearlyInterest() // Added 5% interest 1000 + 50
savingAccount1.showBalance() // 1050
savingAccount1.showTransactionHistory()
savingAccount1.addTransaction(transaction: Transaction(type: .deposit(amount: 500), date: Date())) // 1050 + 500 = 1550
savingAccount1.showBalance() // $1550

// Trying to transfer between saving accounts
var savingAccount2 = ClientSavings(balance: 500)
savingAccount1.transfer(to: savingAccount2, amount: 2000) // Unsuccessful transfer
savingAccount1.transfer(to: savingAccount2, amount: 200) // Successful transfer
savingAccount1.showBalance() // 1550 - 200 = 1350
savingAccount2.showBalance() // 500 + 200 = 700
savingAccount1.showTransactionHistory() // show the transfer in the transactions
savingAccount2.showTransactionHistory()
