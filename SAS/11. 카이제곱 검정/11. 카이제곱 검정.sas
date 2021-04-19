/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\09. [산격동 너구리] Chi Square 예제.csv"
	out= work.data dbms = csv replace;
run;

/* 카이제곱 검정 */
proc freq data = data;
	table country * movie / chisq expected;
run;
