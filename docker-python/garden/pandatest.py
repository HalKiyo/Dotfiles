"""
document
"""

import random
from pprint import pprint
import numpy as np
import pandas as pd


def panda():

    timestep = [[np.random.randint(2) for _ in range(9)] for __ in range(3)]
    index = [f'station{i}' for i in range(3)]
    columns = list(map(str, np.arange(9)))
    df = pd.DataFrame(timestep, index=index, columns=columns)
    print(df)
    return df


def pandafilter():
    df = pd.DataFrame([[0, 1, 2, ], [3, 4, 5], [6, 7, 8]],
                      index=['apple', 'banana', 'pineapple'],
                      columns=['A', 'B', 'C'])
    print(df)

    matrixfilter = df.filter(items=['A', 'C'], axis='columns') \
        .filter(items=['apple', 'pineapple'], axis='index')

    print(matrixfilter)


def bigger():
    dates = ['April-10', 'April-11', 'April-12',
             'April-13', 'April-14', 'April-16']
    sales = [200, 300, 400, 200, 300, 300]
    prices = [3, 1, 2, 4, 3, 2]
    df = pd.DataFrame({
        'Data': dates,
        'Sales': sales,
        'Price': prices
    })
    print(df)

    reqd_index = df[df['Sales'] >= 300].index.tolist()
    print(reqd_index)


def fullsearch(df=None):
    if df is None:
        df = panda()

    ls = []
    for i in df.index:
        for j in df.columns:
            if df.at[i, j] == 1:
                ls.append([i, j])
    failures = np.array(ls)
    print('failures:')
    pprint(failures)

    fail_lst = []
    sampled_ind = np.array(random.sample(list(set(failures[:, 0])), 2))
    print(f"sampled: \n {sampled_ind}")
    print("choiced:")
    for _sample in sampled_ind:
        choiced = random.choice(failures[failures[:, 0] == _sample, 1])
        fail_lst.append([_sample, choiced])
        print(f"{_sample}, {choiced}")

    fail_times = np.array(fail_lst)[:,1]
    timestep, line_status = str(3), True

    if (timestep == fail_times).any():
        line_status = False
    print(f"line_status: \n {line_status}")


def randsearch(df=None):
    if df is None:
        df = panda()

    ls = []
    sample = 3
    for _ in range(sample):
        req_columns = df.loc[:, (df == 1).any()].columns.tolist()
        rand_column = random.choice(req_columns)
        req_index = df[df[rand_column] == 1].index.tolist()
        rand_index = random.choice(req_index)
        ls.append([rand_column, rand_index])

    print(ls)


def listfilter():
    df = panda()

    timestep, line_status = str(3), True

    check = timestep == failtimes


if __name__ == '__main__':
    fullsearch()
