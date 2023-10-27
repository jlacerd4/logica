abstract sig Fazendeiro{}

sig Dono in Fazendeiro {}

one sig A, B, C extends Fazendeiro{}


pred dono(f: Fazendeiro){
    f in Dono
}

pred a1{
    C in Dono
}

pred a2{
    A not in Dono
}

pred b1{
    C not in Dono
}

pred b2{
    A in Dono
}

pred c1{
    C in Dono
}

pred c2{
    A not in Dono
}


fact "Restricoes" {
    one x : Fazendeiro | dono(x)
    
}