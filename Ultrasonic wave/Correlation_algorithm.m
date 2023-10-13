% �����ź����ݵ��ܳ���Ϊ M
% ���� N ΪĿ���źų���
% �����ֵ�洢����Ϊ "Amplitude" ��������

% ����Ŀ���ź� X ����ʼ�����ֹ��
start_point_X = 750;
end_point_X = 900;

% �����ź�Yi����ʼ�����ֹ��
start_point_Yi = 900;
end_point_Yi = 1050;

% N ΪĿ���źų��ȣ����������趨Ϊ 150
N = 150;

% M Ϊ�ź������ܳ���
M = 2500;

% ����1: �����ź����ݴ洢����Ϊ "Amplitude" ��������
% ���� "Amplitude" ���ź����ݶ�Ӧ�ķ�ֵ
% �����ʵ������滻Ϊ���ķ�ֵ����

% ����2: ȡĿ���ź�X�����ֵ
X_amplitude = Amplitude(start_point_X:end_point_X);
X_time = Time(start_point_X:end_point_X);  % ��Ӧ��ʱ��

% ����3��4: �������ϵ�����ҵ�������ϵ������λ��
max_correlation = -Inf;
best_match_index = 0;

for i = start_point_Yi:(M - N + 1)
    % ȡ����Ϊ N ���ź�Yi�����ֵ
    Yi_amplitude = Amplitude(i:i+N-1);
    
    % ������Ŀ���ź�X�ķ�ֵ�����ϵ����Pearson���ϵ����
    correlation = corr(X_amplitude', Yi_amplitude');
    
    % ����������ϵ�������Ӧλ��
    if correlation > max_correlation
        max_correlation = correlation;
        best_match_index = i;
    end
end

% ����5: ������ϵ������Ϊ�ڶ����ź��շ���
disp(['�ڶ����ź��շ���λ��: ', num2str(best_match_index)]);
disp(['������ϵ��: ', num2str(max_correlation)]);

% ����6: �ڲ���ͼ���ú������һ�κ͵ڶ����ź��շ���
figure;
plot(Time, Amplitude, 'b');  % ԭʼ�ź�����ɫ��ʾ
hold on;
plot(X_time, X_amplitude, 'r', 'LineWidth', 2);  % ��һ���ź��շ����ú�ɫ���
plot((best_match_index:(best_match_index + N - 1)), Amplitude((best_match_index:(best_match_index + N - 1))), 'r', 'LineWidth', 2);  % �ڶ����ź��շ����ú�ɫ���
xlabel('ʱ��');
ylabel('�źŷ�ֵ');
title('�źŲ���ͼ');
legend('ԭʼ�ź�', '��һ���ź��շ���', '�ڶ����ź��շ���');
