data = readtable(‘00.toy_example_full.csv');

% Remove Column with NaN values
data_nan = rmmissing(data, 2);

data_uniq = unique(data_nan, 'rows', 'stable')
