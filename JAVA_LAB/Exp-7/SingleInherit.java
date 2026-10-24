class SingleInherit {
    public static void main(String[] args) {
        Department obj;

        obj = new Department(
            "NIT",
            "B.K.Sinha",
            "Electronics",
            "B.C.Rai"
        );

        obj.displayCollegeDetails();
        obj.displayDepartmentDetails();
    }
}