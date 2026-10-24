class Department extends College {
    String departmentName, HODName;

    Department(String collegeName, String principalName,
               String departmentName, String HODName) {

        super(collegeName, principalName);

        this.departmentName = departmentName;
        this.HODName = HODName;
    }

    void displayDepartmentDetails() {
        System.out.println("DepartmentName:" + departmentName);
        System.out.println("HODName:" + HODName);
    }
}