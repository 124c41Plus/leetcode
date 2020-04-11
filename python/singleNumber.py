class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        count = collections.Counter(nums)
        for x in count:
            if count[x] < 2:
                return x