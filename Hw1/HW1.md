#### Answer 1.

1. Variance(x) <-> $Var(x)$

$Var(x)$
=$E[(x-\mu)^2]$
=$E[x^2+\mu^2-2\mu*x]$
=$E[x^2]+E[\mu^2]-2*E[\mu*x]$  (by linearity of expectation)
=$E[x^2]+\mu^2-2*\mu*E[x]$   ($\mu^2=E[\mu^2]$ and $\mu*E[x]=E[\mu*x]$ as $\mu$ is a constant)
=$E[x^2]+\mu^2-2*\mu^2$ ($\mu=E[x]$ -> defination of mean)
=$E[x^2]-\mu^2$


<div align="right">
<b>
QED
</b>
</div>


2. Variance($\vec x$)<-> $Var(\vec x)$

$Var(\vec x)$
= $E[(\vec x-\mu)(\vec x-\mu)^T]$
= $E[\vec x*\vec x^T -\vec x*\mu^T-\mu*\vec x^T+\mu*\mu^T]$
= $E[\vec x*\vec x^T] -E[\vec x*\mu^T]-E[\mu*\vec x^T] +E[\mu*\mu^T]$ (by linearity of expectation)
= $E[\vec x*\vec x^T] -E[\vec x]*\mu^T-\mu*E[\vec x^T] +\mu*\mu^T$
= $E[\vec x*\vec x^T] -\mu*\mu^T-\mu*\mu^T +\mu*\mu^T$
= $E[\vec x*\vec x^T] -\mu*\mu^T$





<div align="right">
<b>
QED
</b>
</div>

##### References

1. https://en.wikipedia.org/wiki/Variance
2. https://www.wolframalpha.com/
3. https://atom.io
4. https://www.python.org/
5. https://www.scipy.org/
6. https://jupyter.org/
