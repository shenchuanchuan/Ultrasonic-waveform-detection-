% 假设信号数据的总长度为 M
% 假设 N 为目标信号长度
% 假设幅值存储在名为 "Amplitude" 的向量中

% 假设目标信号 X 的起始点和终止点
start_point_X = 750;
end_point_X = 900;

% 假设信号Yi的起始点和终止点
start_point_Yi = 900;
end_point_Yi = 1050;

% N 为目标信号长度，根据描述设定为 150
N = 150;

% M 为信号数据总长度
M = 2500;

% 步骤1: 假设信号数据存储在名为 "Amplitude" 的向量中
% 假设 "Amplitude" 是信号数据对应的幅值
% 请根据实际情况替换为您的幅值数据

% 步骤2: 取目标信号X及其幅值
X_amplitude = Amplitude(start_point_X:end_point_X);
X_time = Time(start_point_X:end_point_X);  % 对应的时间

% 步骤3和4: 计算相关系数并找到最大相关系数及其位置
max_correlation = -Inf;
best_match_index = 0;

for i = start_point_Yi:(M - N + 1)
    % 取长度为 N 的信号Yi及其幅值
    Yi_amplitude = Amplitude(i:i+N-1);
    
    % 计算与目标信号X的幅值的相关系数（Pearson相关系数）
    correlation = corr(X_amplitude', Yi_amplitude');
    
    % 更新最大相关系数及其对应位置
    if correlation > max_correlation
        max_correlation = correlation;
        best_match_index = i;
    end
end

% 步骤5: 最大相关系数处即为第二次信号收发处
disp(['第二次信号收发处位置: ', num2str(best_match_index)]);
disp(['最大相关系数: ', num2str(max_correlation)]);

% 步骤6: 在波形图上用红框标出第一次和第二次信号收发处
figure;
plot(Time, Amplitude, 'b');  % 原始信号用蓝色表示
hold on;
plot(X_time, X_amplitude, 'r', 'LineWidth', 2);  % 第一次信号收发处用红色标记
plot((best_match_index:(best_match_index + N - 1)), Amplitude((best_match_index:(best_match_index + N - 1))), 'r', 'LineWidth', 2);  % 第二次信号收发处用红色标记
xlabel('时间');
ylabel('信号幅值');
title('信号波形图');
legend('原始信号', '第一次信号收发处', '第二次信号收发处');
