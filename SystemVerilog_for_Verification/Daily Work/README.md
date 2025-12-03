///////////////Structure Pass By Reference///////////////

typedef struct{
        int age = 69;
}Student;

function automatic void printHello(ref Student s);
    s.age = 66;
endfunction

    
module helloWorld();
        
    Student s1;
    
    initial begin
        printHello(s1);
        $display("Age : %d" , s1.age);
    end
    
endmodule

///////////////Structure Pass By Reference///////////////


///////////////2D Structure///////////////

`timescale 1ns / 1ps

typedef struct{
        int age = 69;
}Student;

function automatic void printHello(ref Student s);
    s.age = 66;
endfunction

    
module helloWorld();
        
    Student s[2][3];
    int k = 1;
    int i,j;
    
    initial begin
        
        for(i=0; i<2; i++)
        begin
            for(j=0; j<3; j++)
            begin
                s[i][j].age = k;
                $display("Student[%d][%d] = %d" , i,j,s[i][j].age);
                k++;
            end
        end     
        
    end
    
endmodule

///////////////2D Structure///////////////
