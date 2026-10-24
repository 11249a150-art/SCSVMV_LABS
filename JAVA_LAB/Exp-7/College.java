class College {
    String collegeName, principalName;

    College(String collegeName, String principalName) {
        this.collegeName = collegeName;
        this.principalName = principalName;
    }

    void displayCollegeDetails() {
        System.out.println("CollegeName:" + collegeName);
        System.out.println("PrincipalName:" + principalName);
    }
}