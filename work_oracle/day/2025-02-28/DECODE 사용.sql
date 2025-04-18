--DUAL DECODE 사용

SELECT DECODE('A','B',1) D
--A가B면 1 아니면 2
, DECODE('A','B',1,2) D
--A가A면 1 아니면 2
, DECODE('A','A',1,2) D
-----------
--A가B면 1 아니면 C / A와 C가 맞으면 2 아니면 3
, DECODE('A','B',1,'C',2,3) D
--A가B면 1 아니면 C / A와 A가 맞으면 2 아니면 3
, DECODE('A','B',1,'A',2,3) D
--A가A면 1 아니면 C / A와 C가 맞으면 2 아니면 3
, DECODE('A','A',1,'C',2,3) D
-----------
--A가 B면 디코든데 디코드 값 말고 아닌거 없어서 널
, DECODE('A','B', DECODE('C','D',1) ) D
--A가 A면 디코든데 디코드가 틀려서 널
, DECODE('A','A', DECODE('C','D',1) ) D
--A가 A면 디코든데 디코드가 맞아서 1
, DECODE('A','A', DECODE('C','C',1) ) D
--------
, DECODE('A','A', DECODE('C','D','1','2') ) D
--A가 A면 디코든데 디코드가 C가 D면 1 아니면 2
, DECODE('A','B', DECODE('C','D',1) ,3) D
--A가 B면 디코드 아니면 3
--, DECODE('A','A', DECODE('C','C',1) ) D


   FROM  DUAL;
   