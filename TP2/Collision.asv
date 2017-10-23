function collided = Collision(SpherePos, Radius, BoxCornerA, BoxCornerB)
  P = SpherePos;
  MinP = min(BoxCornerA, BoxCornerB);
  MaxP = max(BoxCornerA, BoxCornerB);
  D = max(max(MinP - P, P - MaxP), 0);
  collided = norm(D) <= Radius;
end