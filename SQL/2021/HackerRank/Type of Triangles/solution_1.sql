SELECT CASE when A+B<=C or B+C<=A or A+C<=B then "NOT A TRIANGLE"
			when A=B and B=C and A=C then "EQUILATERAL"
			when A=B or B=C or A=C then "ISOSCELES"
			else "SCALENE"
			end as sol
from triangles;