class AccountDemo {
    public static void main(String args[]) {
        SBAccount obj1;

        obj1 = new SBAccount(1001, 5000, 6.5);

        obj1.credit(2000);
        obj1.debit(1000);
        obj1.displayBalance();
        obj1.displayInterestRate();
    }
}