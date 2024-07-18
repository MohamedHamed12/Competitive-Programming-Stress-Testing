# ﷽
from itertools import groupby
import sys
input = lambda: sys.stdin.readline().strip()
def inlst():return [int(i) for i in input().split()]
oo=float('inf')

def solve():
    n=int(input())
    lst=inlst()
    lst=sorted(lst)
    dp=[0]*(n)
    dp[0]=lst[0]
    for i in range(1,n):
            dp[i]=dp[i-1]+lst[i]-lst[i-1]-1
    g=[(i,len(list(j))) for i,j in groupby(dp)]
    ans=max(0,g[0][1]-2)
    # print(g)
    for i in range(1,len(g)):
        if g[i][0]-g[i-1][0]==1:
            ans+=g[i][1]*g[i-1][1]
        ans+=max(0,g[i][1]-2)
    print(ans)

def main():
    for i in range(int(input())):
        solve()


if __name__ == "__main__":
    main()
