## Concept
This project focuses on implementing and analysing the Golden Section Search algorithm, a technique used for finding the minimum or maximum of a unimodal function within a given interval. The project explores the algorithm's theoretical foundations, practical implementation, and performance analysis across multiple scenarios.

## Dataset
The project doesn't use a traditional dataset but instead works with mathematical functions, particularly a high-degree polynomial: f(x) = (x-1)(x-2)(x-3)(x-4)(x-5), 1000 randomly generated search instances for testing and analysis and simulated data points for estimating the order of convergence.

## Skills and Technologies
- Python programming<br/>
- Mathematical modeling and optimisation techniques<br/>
- Algorithm implementation and analysis<br/>
- Data visualisation (implied for result presentation)<br/>
- Statistical analysis (for calculating average convergence rates)<br/>
- Numerical methods (for estimating order of convergence)<br/>

## Development

1. Implemented the Golden Section Search algorithm in Python
2. Created functions to estimate the order of convergence using epsilon and successive-difference methods
3. Developed a testing framework to run the algorithm on 1000 random search instances
4. Analysed the algorithm's performance and convergence rates
5. Optimised the code for efficiency and readability
6. Documented the process, including theoretical explanations and practical implementations

```python 
import math

def golden_section_search(f, a, b, tol=1e-6):
    """Find the minimum of a unimodal function f on the interval [a,b]
    to within a tolerance of tol using the Golden Section Search algorithm.
    Returns the minimum value and the sequence of intervals searched."""
    
    # Define the golden ratio
    phi = (1 + math.sqrt(5)) / 2
    
    # Initialize the sequence of intervals searched
    intervals = [(a, b)]
    
    # Iterate until the interval is small enough
    while b - a > tol:
        # Divide the interval into two parts
        x = b - (b - a) / phi
        y = a + (b - a) / phi
        
        # Evaluate the function at the two new points
        fx = f(x)
        fy = f(y)
        
        # Update the interval based on which part has the higher function value
        if fx < fy:
            b = y
        else:
            a = x
        
        # Add the new interval to the sequence
        intervals.append((a, b))
    
    # Return the minimum value and the sequence of intervals searched
    return (a + b) / 2, intervals
def f(x):
    return (x - 2)**2 + 1

min_val, intervals = golden_section_search(f, 0, 5)

print("Minimum value: ", min_val)
print("Intervals searched:")
for i, interval in enumerate(intervals):
    print(f"Iteration {i+1}: {interval}")
```
