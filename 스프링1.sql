CREATE UNIQUE INDEX idx_dept_name ON department(dept_name);

CREATE INDEX idx_name ON employee(name);

DESC user_indexes;

SELECT index_name, uniqueness
  FROM user_indexes
 WHERE table_name = 'DEPARTMENT';
 
SELECT index_name, uniqueness
  FROM user_indexes
 WHERE table_name = 'EMPLOYEE';
 
 DROP INDEX idx_dept_name;
 DROP INDEX idx_name;
 
 