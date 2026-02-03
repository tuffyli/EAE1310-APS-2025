clear
use "C:\Users\tuffy\Downloads\aula-sistema.dta"

cap log close
log using "C:\Users\13640972\Downloads\aula1", text replace
* Comando para realizar o summary
sum

tab w, sum(ked)



reg ked ib1.w i.m_nasc i.sem, rob

test i2.w
test i2.w = i3.w

sureg (aintern ib1.w) (andia ib1.w) (anhiper ib1.w) (aescm ib1.w) (apcrn ib1.w) ///
(aescore ib1.w)


testparm ib1.w
