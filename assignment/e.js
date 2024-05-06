// part i) Function to check if a number is prime
function isPrime(num) {
    if (num <= 1) {
        return false;
    }
    
    for (let i = 2; i <= (num)/2; i++) {
        if (num % i === 0) {
            return false;
        }
    }
    
    return true;
}

// part ii)Find and print all prime numbers between 1 and 10,000
let primes = [];
for (let i = 1; i <= 10000; i++) {
    if (isPrime(i)) {
        primes.push(i);
    }
}
let textareaResult = document.getElementById("result");
textareaResult.value += "Prime Numbers: " + primes.join(", ");





