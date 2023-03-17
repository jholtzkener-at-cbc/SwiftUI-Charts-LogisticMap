# SwiftUI-Charts-LogisticMap

https://en.wikipedia.org/wiki/Logistic_map
Originally from a 1976 paper by biologist Robert May

Provides a simple model of the growth of a population constrained by resources
xn+1 = xn * r (1 - xn)
Where x is the population (as a value between 0 and 1), and r is rate of growth
If r > 1: population grows, r < 1: population shrinks
The population at the next iteration (n + 1) is the current population * the rate of growth modified by the size of the current population: when the current population is small, the rate of growth is high, and when the population is high the rate of growth is small
