sig Local {
    recursos: set Recurso,
    usuarios: set Usuario
}

sig Recurso {
    superior: lone Recurso // one: exatamente 1, lone: 0 ou 1, some: 2 ou mais. (set tambem é um desses negócios)

}

sig Usuario {
    acessa: set Recurso
}

fact "usuario nao compartilhado"{
    all u: Usuario | one l:Local | u in l.usuarios 
}// para todo usuario há um local tq. usuario pertence a local

/*
fact "recurso nao compartilhado"{
    all r: Recurso | one l:Local | r in l.usuarios
}
*/

fact "usuarios acessam hierarquia"{
    //para qualquer usuario e recurso, se usuario acessa recurso, usuario acessa os recursos inferiores
    all u:Usuario, r:Recurso | r in u.acessa implies inferiores[r] in u.acessa 
}

fact "sem ciclos"{
    all r:Recurso | r not in r.^superior // ^ pega todos os recursos ligados direta ou indiretamente a 'r'
}


fun inferiores[r:Recurso]: set Recurso{
    {r1: Recurso | r in r1.^superior} 
}

assert recursoNaoCompartilhado{
    !(some r:Recurso | #(recursos.r) > 1) 
}

check recursoNaoCompartilhado // há contraexemplo


run {} for 5 but exactly 2 Local // todos os conjuntos vão ter exatamente 5 objetos, mas para o local eu quero exatamente 2 objetos