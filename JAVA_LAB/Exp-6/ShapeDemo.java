import java.util.*;

class ShapeDemo {
    public static void main(String arg[]) {
        int r, h;

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter radius & height-");
        r = sc.nextInt();
        h = sc.nextInt();

        Cylinder c1 = new Cylinder();
        Sphere s1 = new Sphere();

        System.out.println("Volume of Cylinder:" + c1.volume(r, h));
        System.out.println("Area of Sphere:" + s1.area(r));
    }
}