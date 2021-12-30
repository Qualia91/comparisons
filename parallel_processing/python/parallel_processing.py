from multiprocessing import Pool

matrix = [
    [0,1,2,3,4],
    [5,6,7,8,9],
    [10,11,12,13,14],
    [5,6,7,8,9],
    [0,1,2,3,4]
]

def edit_row(i):
    for idx, val in enumerate(matrix[i]):
        matrix[i][idx] = val * 2
    return matrix[i]

def print_matrix(matrix):
    for row in matrix:
        print(row)

if __name__=='__main__':
    pool = Pool(processes=5)
    list_start_vals = range(len(matrix))
    updated_matrix = pool.map(edit_row, list_start_vals)
    pool.close()
    print_matrix(updated_matrix)