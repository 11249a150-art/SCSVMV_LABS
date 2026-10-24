class Result extends Student implements Exam {
    Result(String n, int r, int m1, int m2) {
        super(n, r, m1, m2);
    }

    public void percent_cal() {
        int total = mark1 + mark2;
        float percent = total * 100.0f / 200.0f;

        System.out.println("Percentage: " + percent + "%");
    }

    void display() {
        super.display();
    }
}