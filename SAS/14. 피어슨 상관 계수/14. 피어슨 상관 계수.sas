/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\13. [산격동 너구리] 상관 분석 예제.csv"
	out= work.data dbms = csv replace;
run;

/* 정규성 */
proc univariate data = data normal ;
	var var1-var3;
run;

/* 피어슨 상관 계수 */
/* + 산점도 */
proc corr data = data pearson plots = matrix;
	var var1-var3 ;
run;
