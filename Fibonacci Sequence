fibonacci <- function(i)
{
    if(i <= 1) 
    {
        return(i)
    } 
    else 
    {
        return(fibonacci(i-1) + fibonacci(i-2))
    }
}

terms = as.integer(readline(prompt="How many terms would you like to print on-screen? "))

if(terms <= 0) 
{
    print("Please select a positive integer.")
} 
else 
{
    print("First",terms,"terms of the Fibonacci sequence are: ")
    for(n in 0:(terms-1)) 
    {
        print(fibonacci(n))
    }
}
