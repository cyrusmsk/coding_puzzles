import std;

void countSquares(long a, long b, long c, long d, ref long res)
{
	if (a + b + c + d == 0L)
	{
		res++;
	}
	else
	{
		countSquares(abs(a - b), abs(b - c), abs(c - d), abs(d - a), ++res);
	}
}

void checkExamples() {
	Tuple!(long, long, long, long) points;
	int maxV = 1000;
	long M, M_rev;
	foreach(h;1..maxV) {
		M = 0;
		long S = 4*maxV;
		long res = 0;
		long a = 0;
			foreach(b;iota(h))
				foreach(c;iota(h))
					foreach(d;iota(h)) {
						res = 0L;
						countSquares(a,b,c,d,res);
						if (res > M) {
							M = res;
							S = 4*maxV;
						}
						if ((a+b+c+d < S) && (res == M)) {
								S = a+b+c+d;
								points = tuple(a,b,c,d);
							}
					}
		if (M != M_rev) {
			writeln("H=",h);
			writeln("M=",M);
			writeln(points);
			M_rev = M;
		}
	}
}

void main()
{
	// let's check the pattern
	checkExamples();

	long[3][] res;
	long[3] stage1 = [0, 1, 3];
	long[3] stage2 = [1, 2, 4];
	long[3] stage3 = [1, 4, 9];

	while ((stage3[2] < 10_000_000) &&
		(stage2[2] < 10_000_000) &&
		(stage1[2] < 10_000_000))
	{
		long[3] tmp1, tmp2, tmp3;
		tmp1[0] = stage2[1];
		tmp1[1] = stage3[2] - stage3[1];
		tmp1[2] = tmp1[0] + stage3[2];

		tmp2[0] = stage2[0] + stage3[0];
		tmp2[1] = tmp1[0] + stage3[1];
		tmp2[2] = tmp2[0] + tmp1[2];

		tmp3[0] = tmp1[1];
		tmp3[1] = tmp3[0] * 2 + tmp2[0] * 2;
		tmp3[2] = tmp3[1] + tmp2[1] + tmp1[2];

		res ~= tmp1;
		res ~= tmp2;
		res ~= tmp3;

		stage1 = tmp1;
		stage2 = tmp2;
		stage3 = tmp3;
	}

	writeln(res[$-2]);
	long answer = 0L;
	countSquares(0, res[$-2][0], res[$-2][1], res[$-2][2], answer);
	writeln(answer);
}
