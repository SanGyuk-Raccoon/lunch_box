/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\08. [산격동 너구리] Cronbach's Alpha 예제.csv"
	out= work.data dbms = csv replace;
run;

/* A에 대한 크론바흐 알파 */
proc corr data = data alpha ;
	var a1-a5;
run;

/* B에 대한 크론바흐 알파 */
proc corr data = data alpha ;
	var b1-b5;
run;
