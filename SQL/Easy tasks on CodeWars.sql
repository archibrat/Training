/*-----1
You are given a table 'random_string' that has the following format:
** random_string schema **
text
The text field holds a single row which contains a random string.
Your task is to take the random string and split it on each vowel (a, e, i, o, u) then the resultant substrings will be contained in the output table, formatted as:
** output table schema **
results
Note that the vowels should be removed.
If there are no vowels, there will only be one row returned. Where there are multiple vowels in succession, you will see empty rows. 
A row should ebe created on each break, whether there is content in the row or not.
Regex is advised but not mandatory.
*/
SELECT  regexp_split_to_table(text,'a|e|i|o|u') AS results
FROM random_string;

/*-----2
You are given a table named repositories, format as below:
** repositories table schema **
project
commits
contributors
address
The table shows project names of major cryptocurrencies, their numbers of commits and contributors and also a random donation address ( not linked in any way :) ).
For each row: Return first x characters of the project name where x = commits. Return last y characters of each address where y = contributors.
Return project and address columns only, as follows:
** output table schema **
project
address
Case should be maintained.
*/
SELECT  LEFT(Project,commits)       AS project
       ,right(address,contributors) AS address
FROM repositories 

/*------3
You are given a table with the following format:
** encryption table schema **
md5
sha1
sha256
Problem is the table looks so unbalanced - the sha256 column contains much longer strings. You need to balance things up. 
Add '1' to the end of the md5 addresses as many times as you need to to make them the same length as those in the sha256 column. 
Add '0' to the beginning of the sha1 values to achieve the same result.
Return as:
** output table schema **
md5
sha1
sha256
*/

SELECT  CONCAT(md5,REPEAT('1',LENGTH(sha256) - LENGTH(md5)))  AS md5
       ,CONCAT(REPEAT('0',LENGTH(sha256)- LENGTH(sha1)),sha1) AS sha1
       ,sha256
FROM encryption;



/*---------4
You will need to create SELECT statement in conjunction with LIKE.
Please list people which have first_name with at least 6 character long
*/
SELECT  first_name
       ,last_name
FROM names
WHERE first_name like '______%' 

--where first_name ~ '.{6,}'



/*-----------5
Given a demographics table in the following format:
** demographics table schema **
id
name
birthday
race
return a single column named 'calculation' where the value is the bit length of name, added to the number of characters in race.
*/

SELECT  CAST(CONCAT(BIT_LENGTH(NAME)+CHAR_LENGTH(RACE)) AS int) AS calculation
FROM demographics 


/*------------6
You need to check what products are running out of stock, to know which you need buy in a CompanyA warehouse.
Use SELECT to show id, name, stock from products which are only 2 or less item in the stock and are from CompanyA.
Order the results by product id
*/
SELECT  id
       ,name
       ,stock
FROM PRODUCTS
WHERE stock<=2 
AND producent like 'CompanyA'
ORDER BY id 


/*------7
Simple Fun #74: Growing Plant
*/

SELECT id, 
  CASE WHEN desired_height <= up_speed THEN 1
  ELSE CEIL((desired_height - up_speed)::decimal / (up_speed - down_speed))::int + 1 
  END AS num_days
FROM growing_plant
