class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        
        if s == " ":
            return 1
        elif s == "":
            return 0
        else:
            left = 0 
            right = 0
            result = []
            while right < len(s):
                if s[right] not in s[left:right]:
                    right += 1
                else:
                    result.append(right - left)
                    left += 1
            result.append(right - left)
        
            return max(result)
