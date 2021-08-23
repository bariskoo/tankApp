clc %clearing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%preparing needed variables
[sizeOfRow, sizeOfColumn] = size(xlsread('3.08.2021.xlsx', 'Sayfa1', 'D:D'));
%sizeOfColumn: column number/sizeOfRow: Row number
%D:D -> Reading all D column

%to read all clock in clock time column (B column)
[~,time] = xlsread('3.08.2021.xlsx', 'Sayfa1', append('B2:B', string(sizeOfRow)));
%[~,time] -> to read column as string

%to read all flowmeter values in flowmeter column (D column)
flowmeter = xlsread('3.08.2021.xlsx', 'Sayfa1', append('D2:D', string(sizeOfRow)));

'excel'

%when data logger is opened
startOfDatalogger = 0;

%when filling tank is started
startOfFilling = 0;

%when filling tank is finished
finishOfFilling = 0;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%to find row number of when data logger is opened
for i = 1:length(time)
    if strcmp(time{i},'14:22:15')
    startOfDatalogger = i;
    break
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%to find row number of when filling tank is started
for k = startOfDatalogger:length(time)
    if flowmeter(k) > 0.5
    startOfFilling = k - 50;
    break
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%to find row number of when filling tank is finished
for j = startOfFilling + 70:length(time)
    if flowmeter(j) < 0.25
    finishOfFilling = j + 50;
    break
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%to plot pressure graph
tank_1 = xlsread('3.08.2021.xlsx', 'Sayfa1', append('E', string(startOfFilling),':F', string(finishOfFilling))); 
tank_2 = xlsread('3.08.2021.xlsx', 'Sayfa1', 'E25401:E26000');
value1 = tank_1(:, 1);
value2 = tank_1(:, 2);
value3 = tank_2(:, 1);
t=0.05:0.05:(finishOfFilling-startOfFilling+1)*0.05;
holding = length(value3);
for i = 1:finishOfFilling - startOfFilling - length(value3) + 1
    value3(length(value3)+1) = value3(holding);
end
'bitti'


