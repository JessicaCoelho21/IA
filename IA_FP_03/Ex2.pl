carOrigin(DIS, MPG, HP, R):-(DIS > 168, R = american), !; (dis(DIS,MPG,HP,R1), R = R1).

dis(DIS,MPG,HP,R):- (DIS <= 97, mpg(MPG, R1), !; (DIS > 97, horsepower(HP, R1), R = R1)).
mpg(MPG, R):- (MPG =< 30, R = european), !; (MPG > 30, R = japanese).
horsepower(HP, R):- (HP =< 92, R = japanese), !; (HP > 92, R = american).

