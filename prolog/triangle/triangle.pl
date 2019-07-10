triangle(Side1, Side2, Side3, Type):-
    Side1 > 0,
    Side2 > 0,
    Side3 > 0,
    Side1 < Side2 + Side3,
    Side2 < Side1 + Side3,
    Side3 < Side1 + Side2,
    ( Side1 = Side2, Side2 = Side3 -> Type = "equilateral";
      Side1 \= Side2, Side2 \= Side3, Side1 \= Side3 -> Type = "scalene";
      Type = "isosceles"
    ).
