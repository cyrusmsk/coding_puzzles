import std;

immutable int[6][6] grid = [
  [57, 33, 132, 268, 492, 732],
  [81, 123, 240, 443, 353, 508],
  [186, 42, 195, 704, 452, 228],
  [-7, 2, 357, 452, 317, 395],
  [5, 23, -4, 592, 445, 620],
  [0, 77, 32, 403, 337, 452]
];

struct Cell
{
  int i, j;

  auto opBinary(string op : "+")(const Cell rhs) const
  {
    return Cell(this.i + rhs.i, this.j + rhs.j);
  }
}

immutable struct Dice
{
  Nullable!int top, bottom, left, right, front, back;

  Dice moveDice(Direction direction, Nullable!int newTop)
  {
    if (direction == Direction.left)
    {
      Dice newDice = {
        top: this.right.isNull ? newTop : this.right,
        bottom: this.left,
        left: this.top,
        right: this.bottom,
        front: this.front,
        back: this.back
      };
      return newDice;
    }
    else if (direction == Direction.right)
    {
      Dice newDice = {
        top: this.left.isNull ? newTop : this.left,
        bottom: this.right,
        left: this.bottom,
        right: this.top,
        front: this.front,
        back: this.back
      };
      return newDice;
    }
    else if (direction == Direction.up)
    {
      Dice newDice = {
        top: this.back.isNull ? newTop : this.back,
        bottom: this.front,
        left: this.left,
        right: this.right,
        front: this.top,
        back: this.bottom
      };
      return newDice;
    }
    else if (direction == Direction.down)
    {
      Dice newDice = {
        top: this.front.isNull ? newTop : this.front,
        bottom: this.back,
        left: this.left,
        right: this.right,
        front: this.bottom,
        back: this.top
      };
      return newDice;
    }
    writeln("Unknown dice");
    return this;
  }
}

enum Direction
{
  left = Cell(0, -1),
  right = Cell(0, 1),
  up = Cell(-1, 0),
  down = Cell(1, 0)
}

immutable struct State
{
  Cell cell;
  int[2][] moves;
  int sum;
  int step;
  Dice dice;

  immutable(State) makeMove(Direction direction)
  {
    auto newCell = this.cell + (direction);
    auto oldSum = this.sum;
    auto newMoves = this.moves ~ [newCell.i,newCell.j];
    immutable(State) newState =
    {
      cell: newCell,
      moves: newMoves,
      sum: grid[newCell.i][newCell.j],
      step: this.step + 1,
      dice: this.dice.moveDice(direction, nullable(
          (grid[newCell.i][newCell.j] - oldSum) / (this.step + 1)))
    };

    return newState;
  }
}

void search(immutable State s)
{
  if (s.cell == Cell(0, 5))
  {
    writeln("Success");

    long res;
    foreach (i; 0 .. 6)
    {
      foreach (j; 0 .. 6)
      {
        if (!(s.moves.canFind([i,j])))
          res += grid[i][j];
      }
    }
    writeln("Answer:",res);
    return;
  }
  if (s.cell.i < 5)
  {
    if (checkMove(s, Direction.down))
      search(s.makeMove(Direction.down));
  }
  if (s.cell.j < 5)
  {
    if (checkMove(s, Direction.right))
      search(s.makeMove(Direction.right));
  }
  if (s.cell.i > 0)
  {
    if (checkMove(s, Direction.up))
      search(s.makeMove(Direction.up));
  }
  if (s.cell.j > 0)
  {
    if (checkMove(s, Direction.left))
      search(s.makeMove(Direction.left));
  }
}

bool checkMove(immutable State s, Direction d)
{
  auto newCell = s.cell + d;
  // check if there are suitable number on dice or Null which means we could try to assign a new value
  if (d == Direction.left)
  {
    if (s.dice.right == (grid[newCell.i][newCell.j] - s.sum) / (s.step + 1))
    return true;
  else if ((s.dice.right.isNull) && ((grid[newCell.i][newCell.j] - s.sum) % (s.step + 1) == 0))
    return true;
  else
      return false;
  }
  else if (d == Direction.right)
  {
    if (s.dice.left == (grid[newCell.i][newCell.j] - s.sum) / (s.step + 1))
    return true;
  else if ((s.dice.left.isNull) && ((grid[newCell.i][newCell.j] - s.sum) % (s.step + 1) == 0))
    return true;
  else
      return false;
  }
  else if (d == Direction.up)
  {
    if (s.dice.back == (grid[newCell.i][newCell.j] - s.sum) / (s.step + 1))
    return true;
  else if ((s.dice.back.isNull) && ((grid[newCell.i][newCell.j] - s.sum) % (s.step + 1) == 0))
    return true;
  else
      return false;
  }
  else if (d == Direction.down)
  {
    if (s.dice.front == (grid[newCell.i][newCell.j] - s.sum) / (s.step + 1))
    return true;
  else if ((s.dice.front.isNull) && ((grid[newCell.i][newCell.j] - s.sum) % (s.step + 1) == 0))
    return true;
  else
      return false;
  }
  writeln("Unknown direction");
  return true;
}

void main()
{
  immutable State s = {Cell(5, 0)};
  search(s);
}
