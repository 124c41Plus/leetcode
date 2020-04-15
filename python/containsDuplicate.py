class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
      """
      I am baffled at why I am so stupid to have not thought of it this way.
      Take that list and turn it into a set.
      Then compare it to the length of the original list.
      If they're not equal, return true.
      If equal, it does not contain a duplicate so return false.
      """
        return len(nums) != len(set(nums))