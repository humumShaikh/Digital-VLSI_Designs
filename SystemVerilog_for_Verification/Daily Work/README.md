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
