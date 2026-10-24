//Aim:
To write a Java program to demonstrate thread priorities using the Thread class.

//Algorithm:
Start the program.
Create three threads: A, B, and C.
Set minimum priority for thread A, normal-plus-one priority for thread B, and maximum priority for thread C.
Start all three threads.
Display the messages and numbers from each thread.
Stop the program.


//program:
class A extends Thread {
    public void run() {
        System.out.println("Thread A started");
        for (int i = 1; i <= 4; i++) {
            System.out.println("from thread A i=" + i);
        }
        System.out.println("exit from A");
    }
}

class B extends Thread {
    public void run() {
        System.out.println("Thread B started");
        for (int j = 1; j <= 4; j++) {
            System.out.println("from thread B j=" + j);
        }
        System.out.println("exit from B");
    }
}

class C extends Thread {
    public void run() {
        System.out.println("thread C started");
        for (int k = 1; k <= 4; k++) {
            System.out.println("thread c =" + k);
        }
        System.out.println("exit from c");
    }
}

public class ThreadPriority {
    public static void main(String[] args) {
        A threadA = new A();
        B threadB = new B();
        C threadC = new C();

        threadC.setPriority(Thread.MAX_PRIORITY);
        threadB.setPriority(threadA.getPriority() + 1);
        threadA.setPriority(Thread.MIN_PRIORITY);

        System.out.println("start thread A");
        threadA.start();

        System.out.println("start thread B");
        threadB.start();

        System.out.println("start thread C");
        threadC.start();

        System.out.println("end of main thread");
    }
}

//Output
start thread A
start thread B
Thread A started
from thread A i=1
start thread C
Thread B started
from thread B j=1
from thread B j=2
from thread B j=3
from thread B j=4
exit from B
thread C started
thread c =1
thread c =2
thread c =3
thread c =4
exit from c
end of main thread
from thread A i=2
from thread A i=3
from thread A i=4
exit from A
    
//Result:
The program successfully demonstrates thread creation and setting priorities using setPriority() in Java.