
clear


use "C:\Users\13640972\Downloads\aula-aleat-2023.dta"
cap log close

log using "C:\Users\13640972\Downloads\aula_2", text replace

sum

* Checar se todos os valores são iguais entre treat e non-treat. Teste das médias

tab w ano

ttest notam if ano == 2007, by(w)
ttest notap if ano == 2007, by(w)
ttest sexo if ano == 2007, by(w)
ttest trab if ano == 2007, by(w)
ttest comp if ano == 2007, by(w)
ttest quarto if ano == 2007, by(w)
ttest livros if ano == 2007, by(w)
ttest cor if ano == 2007, by(w)

*O coeficiente da reg linear simples é a diferença de médias
*Reg simples é teste de média

reg notam w if ano == 2007, rob


*Teste depois do programa
ttest notap if ano == 2010, by(w)
ttest notam if ano == 2010, by(w)

reg notam w sexo cor trab comp livros quarto if ano == 2010, rob


gen t = 1 if w == 1 & ano == 2010
replace t = 0 if w == 1 & ano == 2007
replace t = 0 if w == 0 

xtset id ano
xtreg notam t i.ano, re
xtreg notam t i.ano, fe


*HAUSMANN
*H0 efeito especifico não é correlacionado com X
xtreg notam t i.ano, fe
estimates store naercio
xtreg notam t i.ano, re
estimates store carlos
hausman naercio carlos
