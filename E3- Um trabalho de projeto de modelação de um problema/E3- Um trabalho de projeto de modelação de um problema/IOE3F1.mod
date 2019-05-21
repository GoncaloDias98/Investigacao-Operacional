param N_Paletes;

param N_Niveis;

set P:={i in 1..N_Paletes};

set N:={j in 1..N_Niveis};

param Palete {i in P, k in 1..7};

param Nivel {j in N, k in 1..7};

var X {i in P, j in N}, binary;

minimize Tempo_Total_acesso: sum{i in P, j in N} Palete [i, 7] * Nivel[j,2]* X[i,j];

#Restricoes
subject to arrumaPalete {i in P}: sum {j in N} X [i,j]=1;

subject to ocupar_nivelPalete {j in N}: sum {i in P} X[i,j] <=1;

#2etapa
#subject to ocupar_nivelPalete {j in N}: sum {i in P} Palete[1,3] <= Nivel[j,3];