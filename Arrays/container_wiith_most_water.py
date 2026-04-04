class Solution(object):
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        left = 0 
        right = len(height) - 1
        result = []


        while left < right:
            curr = ((right - left) * min(height[left], height[right]))
            result.append(curr)
            if height[left] < height[right]:
                left += 1
            else:
                right -= 1

        return max(result)
