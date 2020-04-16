class Solution:
    def romanToInt(self, s: str) -> int:
        num = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
        #you can assign multiple variables in a single line: res, prev are both assigned 0.
        res, prev = 0, 0
        #we store the value 'prev' to remember each previous number each loop
        #for each numeral in reverse(s) -- this time I'm using the reversed generator function for extra lazzzzzzy:
        #Roman numerals suck because you basically have to read them backwards and subtract if 
        #the previous value is greater than the currently read in value, hence the need for
        #the prev variable.
        for i in reversed(s):
            if num[i] >= prev:
                res += num[i]
            else:
                res -= num[i]
            prev = num[i]
        return res