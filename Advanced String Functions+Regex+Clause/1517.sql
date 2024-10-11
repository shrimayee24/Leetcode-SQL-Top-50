SELECT user_id,name,mail FROM Users
  #select mails having :
  #1. first character as uppercase or lowercase
  #2. remaining characters as uppercase or lowercase or digits from 0-9 or . or -
  #3. lastly having string @leetcode.com at end
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'
