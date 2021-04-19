/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\01. [산격동 너구리] 일표본 T 검정 예제.csv"
	out= work.data dbms = csv replace;
run;

/* 정규성 검정하기 */
proc univariate data = data normal ;
	var height;
run;

/* 일표본 t-test 하기 */
proc ttest data = data H0 = 150 ;
	var height;
run;

