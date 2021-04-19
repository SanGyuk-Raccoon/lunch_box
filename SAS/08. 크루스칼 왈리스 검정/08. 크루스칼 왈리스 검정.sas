/* SAS는 내가 실행시킬 줄을 드래그하고 F8을 누르시면 그 문장만 실행됩니다. */
/* 데이터 읽기 */
proc import file = "G:\산격동 너구리\[수정]\예제 파일\07. [산격동 너구리] ANOVA 예제.csv"
	out= work.data dbms = csv replace;
run;

/* Kruskal Wallis test */
proc npar1way data = data wilcoxon;
	class group;
	var time;
run;

/* 사후 검정 */
proc rank data  = data out = data_rank;
	var time;
run;

proc glm data = data_rank;
	class group;
	model time = group;
	lsmeans group / adjust = bon ;
run;
