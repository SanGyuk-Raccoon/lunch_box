/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\05. [산격동 너구리] 윌콕슨 부호 순위 검정(대응표본) 예제.csv"
	out= work.data dbms = csv replace;
run;

/* 전/후 차이 구하기 */
data data_diff;
	set data ;
	diff = after - before;
run;

/* Wilcoxon signed rank test */
proc univariate data = data_diff ;
	var diff ;
run;
