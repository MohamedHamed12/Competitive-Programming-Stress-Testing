M = [0] * pow(10,6)
ind = 2
v = 3
s = 3
M[2] = 1
for i in range(3,len(M)):
    M[i] += M[i-1] + v
    v += s
    s += 1
t = int(input())
for _ in range(t):
    n = int(input())
    arr = list(map(int,input().split()))
    arr.sort()
    ans = 0
    L = []
    c = 1
    for i in range(1,n):
        if arr[i]-arr[i-1]==1:
            c += 1
        else:
            L += [(c,i-1)]
            c = 1
    L += [(c,i-1)]
    for i in range(len(L)):
        c,ind = L[i]
        if i:
            ind_p = L[i-1][1]
            c_p = L[i-1][0]
            if arr[ind_p+1]-arr[ind_p]==2:
                ans += c_p * c
        if c>2:
            ans += M[c-1]
    print(ans)
        