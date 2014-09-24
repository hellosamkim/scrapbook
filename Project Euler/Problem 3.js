primes = [];
number = 600851475143;
numberSqrt = parseInt(Math.sqrt(600851475143));

function isPrime(num) {
    for (var i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    }
    return true;
}

for (var i = 2; i <= numberSqrt; i++ ) {
    if (number % i === 0) {
        if (isPrime(i)) {
            primes.push(i);
        }
    }
}

maxPrime = Math.max.apply(null, primes);
console.log(maxPrime);
    