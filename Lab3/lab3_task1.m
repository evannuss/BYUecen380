n = 10;
p = 0.5;
oldVal = 0;
newVal = 0;

for k = 5:n
    newVal = oldVal + nchoosek(n,k)*((0.5)^k)*((1-p)^(n-k));
    oldVal = newVal;
end