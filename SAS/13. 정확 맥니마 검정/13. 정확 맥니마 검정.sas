/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\12. [산격동 너구리] exact Mcnemar test 예제.csv"
	out= work.data dbms = csv replace;
run;


/* 정확 맥니마 검정 */
proc freq data = data;
	table before * after ;
	exact mcnem;
run;
