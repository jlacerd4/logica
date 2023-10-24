abstract sig Computador{}
sig Rapido, BoaMemoria, Compacto in Computador{}

one sig APPLE, DELL, LENOVO, ACER extends Computador{}

pred ideal(c:Computador){
    (c in Rapido) and (c in BoaMemoria) and (c in Compacto)
} 

fact "Restricoes do problema" {
    one x: Computador | ideal[x]

    (#Rapido = 3) and (#BoaMemoria = 2) and (#Compacto = 1)

    all c:Computador | (c in Rapido) or (c in BoaMemoria) or (c in Compacto)

    (LENOVO in BoaMemoria) <=> (DELL in BoaMemoria)
    (DELL in Rapido) <=> (APPLE in Rapido)
    ((APPLE in Rapido) and !(ACER in Rapido)) or
    ((ACER in Rapido) and !(APPLE in Rapido))

}

run {}