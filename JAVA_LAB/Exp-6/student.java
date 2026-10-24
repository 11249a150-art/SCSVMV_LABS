class Student {
    String name;
    int roll_no, mark1, mark2;

    Student(String n, int r, int m1, int m2) {
        name = n;
        roll_no = r;
        mark1 = m1;
        mark2 = m2;
    }

    void display() {
        System.out.println("Name of Student: " + name);
        System.out.println("Roll No. of Student: " + roll_no);
        System.out.println("Marks of Subject 1: " + mark1);
        System.out.println("Marks of Subject 2: " + mark2);
    }
}