%Ben Buchar's knowledge
%based on the world of Shadow of the Colossus

%4 of the 16 colossi boss battles, of the form:
%colossus(Name,Agro,Height(ft),#).
%where Agro is whether or not your horse Agro can participate in the fight.
%where # = order in which you fight them.

colossus(valus,no,70,1).
colossus(quadratus,yes,98,2).
colossus(phalanx,yes,200,13).
colossus(malus,no,197,16).


foughtBefore(Name1,Name2) :- colossus(Name1,_,_,Order1), colossus(Name2,_,_,Order2),Order1 < Order2.
isTallerThan(Name1,Name2) :- colossus(Name1,_,Height1,_), colossus(Name2,_,Height2,_), Height1 > Height2.
tallest(Name1) :- isTallerThan(Name1,Name2), isTallerThan(Name2,Name3), isTallerThan(Name3,Name4).