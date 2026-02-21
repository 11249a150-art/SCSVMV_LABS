#include<stdio.h>
void tower(int n, char s char d, char a){
    if (n==1) {
        printf("move %d from %c to %c\n", n,s,d);
    return;
    }
    tower(n-1,s,a,d);
    printf("move %d from %c to %c\n",n,s,d):");
    tower (n-1,a,d,s);
}
    int main(){
        int n;
        printf("enter the number of tasks:");
        scanf("%d",&n);
        tower(n,'S','D','T');
        return 0;
    }