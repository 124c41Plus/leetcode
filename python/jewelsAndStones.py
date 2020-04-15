class Solution:
    def numJewelsInStones(self, J: str, S: str) -> int:
        return sum(J.count(i) for i in S)