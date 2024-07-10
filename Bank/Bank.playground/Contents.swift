import Foundation
/*
 "Цель. Научится самому работать со структурами и классами
 Задача.
 Создает объект класса Bank и добавляет несколько счетов.
 Выполняет операции пополнения счета и перевода средств между счетами.
 Печатает состояние всех счетов до и после выполнения операций.
 Результат. Консольная программа"
 */

//MARK: - Account struct
struct Account {
	let id: String
	
	private(set) var balance: Double
	
	var description: String {
		"Account \(id) amount of 💵 - \(balance) "
	}
	
	mutating func withdraw(amount: Double) -> Bool {
		if amount <= balance {
			balance -= abs(amount)
			return true
		} else {
			print("❌ No enough 💵 on \(id) account")
			return false
		}
	}
	
	mutating func add(amount: Double) -> Bool {
		if amount < 0 {
			print("❌ Add negative amount is prohibited")
			return false
		} else {
			balance += amount
			return true
		}
	}
}

//MARK: - Bank Class
final class Bank {
	
	private(set) var accounts: [String : Account] = [:]
	
	func getAllAccounts() {
		if accounts.isEmpty {
			return print("❌ Bank is empty - no accounts\n")
		}
		print("All accounts:")
		accounts.values.sorted { $0.balance < $1.balance }.forEach { account in
			print(account.description)
		}
		print("-------------\n")
	}
	
	func sendMoneyFromTo(from: String, to: String, amount: Double) {
		guard var sender = accounts[from], var receiver = accounts[to] else {
			return print("One of accounts are'n exist, please check")
		}
		print("Send \(amount) from \(from) to \(to) transactions:\n")
		checkOperation(
			sender.withdraw(amount: amount) && receiver.add(amount: amount),
			accounts: sender, receiver
		)
	}
	
	func add(to: String, amount: Double) {
		guard var account = accounts[to] else {
			return print("Account \(to) is'n exist, please check")
		}
		print("Add \(amount) to \(to) transaction:\n")
		checkOperation(account.add(amount: amount), accounts: account)
	}
	
	func withdraw(from:String, amount: Double) {
		guard var account = accounts[from] else {
			return print("Account \(from) is'n exist, please check")
		}
		print("Withdraw \(amount) from \(from) transaction:\n")
		checkOperation(account.withdraw(amount: amount), accounts: account)
	}
	
	func addAccount(_ account: Account) {
		accounts[account.id] = account
		print("Account - \(account.id) was created ✅")
	}
	
	//MARK: Private methods
	private func saveChanges(for account: Account) {
			accounts[account.id] = account
	}
	
	private func printStatusOfAccount(id: String) {
		guard let account = accounts[id] else { return }
		print("Total amount of 💵 on \(id) account - \(account.balance)")
	}
	
	private func checkOperation(_ result: Bool, accounts: Account...) -> Bool {
		if result {
			accounts.forEach { account in
				printStatusOfAccount(id: account.id)
				print("✅ Transaction success")
				saveChanges(for: account)
				printStatusOfAccount(id: account.id)
				print()
			}
			print("-------------\n")
			return true
		} else {
			print("❌ Transaction failed")
			print("-------------\n")
			return false
		}
	}
}

//MARK: - Testing
var bank = Bank()

bank.getAllAccounts()

bank.addAccount(Account(id: "salary", balance: 30000.0))
bank.addAccount(Account(id: "saving", balance: 10000.0))
bank.addAccount(Account(id: "invest", balance: 0.0))

bank.getAllAccounts()

bank.add(to: "invest", amount: 500)
bank.add(to: "salary", amount: 100)

bank.sendMoneyFromTo(from: "salary", to: "invest", amount: -15000)
bank.sendMoneyFromTo(from: "salary", to: "invest", amount: 15000)

bank.withdraw(from: "saving", amount: 40000)
bank.withdraw(from: "saving", amount: 4000)

bank.sendMoneyFromTo(from: "saving", to: "invest", amount: 15000)
bank.sendMoneyFromTo(from: "saving", to: "invest", amount: 1500)

bank.getAllAccounts()

