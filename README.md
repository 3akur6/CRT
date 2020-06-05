CRT, short for [Chinese remainder theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem)   

tired of repeating simple calculation, I make this   
hope this helps   
## Description
CRT is widely used for computing with large integers in number theory, as it allows replacing a computation for which one knows a bound on the size of the result by several similar computations on small integers.

general form:   
x ≡ b<sub>n</sub> (mod m<sub>n</sub>)

## Usage
instantialize CRT:
`crt = CRT::CRT.new(2, 3, 2, 3, 5, 7)`

the args start with b<sub>1</sub>, b<sub>2</sub>, ... , b<sub>n</sub>, and m<sub>1</sub>, m<sub>2</sub>, ... , m<sub>n</sub> are as follows

benefiting from ruby's metaprogramming ability, we can dynamically define methods and just call these methods like this:  

<code>crt.m # => m</code>   
for example, it returns 105 when dealing with the instance beyond   

<code>crt.b1 # => b<sub>1</sub></code>   
returns 2   
<code>crt.m1 # => m<sub>1</sub></code>   
returns 3   
<code>crt.mm1 # => M<sub>1</sub></code>   
returns 35   
<code>crt.mmi1 # => M<sub>1</sub><sup>-1</sup></code>   
returns 2   

methods relating to result:   
<code>crt.almost # => M<sub>1</sub><sup>-1</sup>M<sub>1</sub>b<sub>1</sub>+ M<sub>2</sub><sup>-1</sup>M<sub>2</sub>b<sub>2</sub>+ ... + M<sub>n</sub><sup>-1</sup>M<sub>n</sub>b<sub>n</sub></code>   
returns 23   
<code>crt.result # => M<sub>1</sub><sup>-1</sup>M<sub>1</sub>b<sub>1</sub>+ M<sub>2</sub><sup>-1</sup>M<sub>2</sub>b<sub>2</sub>+ ... + M<sub>n</sub><sup>-1</sup>M<sub>n</sub>b<sub>n</sub> (mod m)</code>   
returns "23(mod 105)"(string)   

## Notes
you should bear it in mind that m<sub>n</sub> must coprime according to the theorem, otherwise it will raise an error like "ms must coprime"
