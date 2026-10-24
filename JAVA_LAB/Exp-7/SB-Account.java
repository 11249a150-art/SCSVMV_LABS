class SBAccount extends Account {
    double rate;

    SBAccount(int accountNumber, int balance, double rate) {
        super(accountNumber, balance);
        this.rate = rate;
    }

    void displayInterestRate() {
        System.out.println("Interest Rate = " + rate);
    }
}