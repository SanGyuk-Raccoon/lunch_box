/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\03. [산격동 너구리] 대응표본 T 검정 예제.csv"
	out= work.data dbms = csv replace;
run;

/* 전/후 차이 계산하기 */
data data_diff ;
	set data ;
	diff = after - before ;
run;

/* 정규성 검정 */
proc univariate data = data_diff normal ;
	var diff;
run;

/* t test */
proc ttest data = data_diff ;
	paired before * after;
run;

proc ttest data = data_diff  H0 = 0 ;
	var diff ;
run;
