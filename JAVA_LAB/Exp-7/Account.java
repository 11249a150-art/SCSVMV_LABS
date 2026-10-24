class Account {
    int accountNumber, balance;

    Account(int accountNumber, int balance) {
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    void credit(int amount) {
        balance = balance + amount;
    }

    void debit(int amount) {
        balance = balance - amount;
    }

    void displayBalance() {
        System.out.println("Balance = " + balance);
    }
}