using System.Collections.Generic;
using System.Linq;

public static class SaddlePoints
{
    public static IEnumerable<(int, int)> Calculate(int[,] matrix)
    {
        var maxPerRow = new List<(int, int)>();
        var minPerColumn = new List<(int, int)>();

        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            var rowMax = 0;
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                if (matrix[i, j] > rowMax)
                    rowMax = matrix[i, j];
            }
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                if (matrix[i, j] == rowMax)
                    maxPerRow.Add((i + 1, j + 1));
            }
        }

        for (int i = 0; i < matrix.GetLength(1); i++)
        {
            var colMin = int.MaxValue;
            for (int j = 0; j < matrix.GetLength(0); j++)
            {
                if (matrix[j, i] < colMin)
                    colMin = matrix[j, i];
            }
            for (int j = 0; j < matrix.GetLength(0); j++)
            {
                if (matrix[j, i] == colMin)
                    minPerColumn.Add((j + 1, i + 1));
            }
        }

        return maxPerRow.Intersect(minPerColumn);
    }
}
