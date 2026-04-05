CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.

      SELECT DISTINCT salary
      FROM (
      SELECT salary , DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
      FROM employee 

      ) e
      WHERE rnk = N
      

  );
END
