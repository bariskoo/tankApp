data_basinc = [3 1 2 8 12];
sum = 0;
for i = 1:length(data_basinc)
    sum = sum + data_basinc(i);
end
mean = sum/length(data_basinc);
sum_squared = 0;
for j = 1:length(data_basinc)
    sum_squared = sum_squared + (data_basinc(j) - mean).^2;
end
standard_deviation = sqrt(sum_squared/length(data_basinc));