class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        old_s = ""

        for i in range(len(s)):
            for j in range(i, len(s)):
                new_s = s[i:j+1]
                if new_s == new_s[::-1] and len(new_s) > len(old_s):
                    old_s = new_s

        return old_s
