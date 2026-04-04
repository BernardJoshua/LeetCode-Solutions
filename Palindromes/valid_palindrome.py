class Solution(object):
    def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        
        cleaned = "".join(char for char in s.lower() if char.isalnum())

        return cleaned == cleaned[::-1]
