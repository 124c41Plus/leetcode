class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        mem = dict()
        for ind, x in enumerate(nums):
            if target-x in mem.keys():
                return [mem.get(target-x), ind]
            mem[x] = ind