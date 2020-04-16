class Solution:
    def isPalindrome(self, x: int) -> bool:
        #apparently, negatives can't be palindromes :/
        if x<0: return False
        #remember the slice syntax: LIST[start:end:position... -1 reverse, 1 forward, 2, skip 1 each round]
        return int(str(x)[::-1]) == x