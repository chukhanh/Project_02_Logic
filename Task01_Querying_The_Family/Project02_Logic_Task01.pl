% Royal Family of  British Royal Family History

% male
male('Prince Phillip').
male('Prince Charles').
male('Captain Mark Phillips').
male('Timothy Laurence').
male('Prince Andrew').
male('Prince Edward').
male('Prince William').
male('Prince Harry').
male('Peter Phillips').
male('Mike Tindall').
male('James Viscount Severn').
male('Prince George').
male('Mia Grance Tindall').

% female
female('Queen Elizabeth II').
female('Camilla Parker Bowles').
female('Princes Diana').
female('Camilla Parker').
female('Princess Anne').
female('Sarah Ferguson').
female('Sophie Ryhs-jones').
female('Kate Middleton').
female('Autumn Kelly').
female('Zara Phillips').
female('Princess Beatrice').
female('Princess Eugenie').
female('Laddy Louise Mountbatten-Windsor').
female('Savannash Phillips').
female('Isla Phillips').
female('Sophie Ehys-jones').
female('The new Princess').
female('Princess Diana').

% born
born('Queen Elizabeth II', '1926').
born('Prince Phillip', '1921').
born('Prince Diana', '1921').
born('Prince Charles', '1948').
born('Camilla Parker Bowles', '1947').
born('Captain Mark Phillips', '1948').
born('Prince Anne', '1950').
born('Timothy Laurence', '1955').
born('Sarah Ferguson', '1959').
born('Prince Andrew', '1960').
born('Sophie Ehys-jones', '1965').
born('Prince Edward', '1964').
born('Prince William', '1982').
born('Kate Middleton', '1982').
born('Prince Harry', '1984').
born('Autumn Kelly', '1978').
born('Peter Phillips', '1977').
born('Zara Phillips', '1981').
born('Mike Tindall', '1978').
born('Princess Beatrice', '1988').
born('Princess Eugenie', '1990').
born('James Viscount Severn', '2007').
born('Laddy Louise Mountbatten-William', '2003').
born('Prince George', '2013').
born('The new Princess', '2015').
born('Savannash Phillips', '2010').
born('Isla Phillips', '2012').
born('Mia Grance Tindall', '2014').

%died
died('Princess Diana', '1997').

%parent
parent('Queen Elizabeth II', 'Princess Charles').
parent('Queen Elizabeth II', 'Princess Anne').
parent('Queen Elizabeth II', 'Princess Andrew').
parent('Queen Elizabeth II', 'Princess Edward').

parent('Prince Phillip', 'Princess Charles').
parent('Prince Phillip', 'Princess Anne').
parent('Prince Phillip', 'Princess Andrew').
parent('Prince Phillip', 'Princess Edward').

parent('Prince Charles', 'Prince William').
parent('Prince Charles', 'Prince Harry').

parent('Princess Diana', 'Prince William').
parent('Princess Diana', 'Prince Harry').

parent('Captain Mark Phillips', 'Peter Phillip').
parent('Captain Mark Phillips', 'Zara Phillips').

parent('Princess Anne', 'Peter Phillip').
parent('Princess Anne', 'Zara Phillips').

parent('Sarah Ferguson', 'Princess Beatrice').
parent('Sarah Ferguson', 'Princess Eugenie').

parent('Prince Andrew', 'Princess Beatrice').
parent('Prince Andrew', 'Princess Eugenie').

parent('Prince William', 'Prince George').
parent('Prince William', 'The new Princess').

parent('Kate Middleton', 'Prince George').
parent('Kate Middleton', 'The new Princess').

parent('Autumn Kelly', 'Savannash Phillips').
parent('Autumn Kelly', 'Isla Phillips').

parent('Peter Phillips', 'Savannash Phillips').
parent('Peter Phillips', 'Isla Phillips').

parent('Zara Phillips', 'Mia Grance').
parent('Mike Tindall', 'Mia Grance').

% married
married('Queen Elizabeth II', 'Prince Phillips').
married('Princess Diana', 'Prince Charles').
married('Captain Mark Phillips', 'Princess Anne').
married('Sarah Ferguson', 'Prince Andrew').
married('Sophie Ryhs-jones', 'Prince Edward').
married('Prince William', 'Kate Middleton').
married('Autumn Kelly', 'Peter Phillips').
married('Zara Phillips', 'Mike Tindall').

%divorced
divorced('Princess Charles', 'Camilla Parker Bowles').
divorced('Princess Anne', 'Timothy Laurence').




% father(Parent, Child): father of Child
father(Parent, Child):- parent(Parent, Child), male(Parent).

% mother(Parent, Child): Mother of Child
mother(Parent, Child):- parent(Parent, Child), female(Parent).

% child(Child, Parent): all children of mother or father
child(Child, Parent):- parent(Parent, Child), Child\=Parent.

% son(Child, Parent): All sons of mother or father
son(Child, Parent):- child(Child, Parent), male(Child).

% daughter(Child, Parent): all daughters of mother or father.
daughter(Child, Parent):- child(Child, Parent), female(Child).

grandparent(GP, GC):- child(GP, P), child(P, GC).

grandmother(GF, GC):- child(GF, P), child(P, GC), female(GC).

grandfather(GF, GC):- child(GF, P), child(P, GC), male(GC).

grandchild(GC, GP):- grandparent(GP, GC).

grandson(GS, GP):- grandchild(GS, GP), male(GS).

granddaught(GD, GP):- grandchild(GD, GP), female(GD).

spouse(Husband, Wife):- married(Husband, Wife); married(Wife, Husband).

husband(Person, Wife):- spouse(Person, Wife), male(Person).

wife(Person, Husband):- spouse(Person, Husband), female(Person).

sibling(Person1, Person2):- child(Person1, P), child(Person2, P), Person1\=Person2.

brother(Person, Sibling):- sibling(Person, Sibling), male(Sibling).

sister(Person, Sibling):- sibling(Person, Sibling), female(Sibling).

uncle(Person1, Person2):- child(Person1, P), brother(Person2, P).

uncle(Person1, Person2):- child(Person1, P), spouse(Person2, P), male(Person2).

aunt(Person1, Person2):- child(Person1, P), sister(Person2, P).

aunt(Person1, Person2):- child(Person1, P), spouse(Person2, P), female(Person2).

nephew(Person1, Person2):- sibling(Person2, P), son(P, Person1).

nice(Person1, Person2):- sibling(Person2, P), daughter(P, Person1).

firstCousin(Child1, Child2):- grandparent(GP, Child1), grandparent(GP, Child2), sibling(Child1, Child2).

%  ancestor(Person1, Person2):- child(Person1, P), child(P, Person2); ancestor(Person2, P), Person1\=Person2, Person1\=sibling(Person1, Person2).

