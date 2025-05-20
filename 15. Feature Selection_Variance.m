% === Variance Thresholding ===
% 분산이 임계값보다 낮은 Feature 제거

threshold = 0.01;  % 사용자 설정 임계값
variances = var(table2array(data_log));  % 각 열의 분산 계산

% 임계값 이상인 열만 선택
columns_to_keep = variances > threshold;

% Feature 이름 가져오기
all_features = data_log.Properties.VariableNames;
selected_features = all_features(columns_to_keep);

% 새로운 데이터 구성
data_varthresh = data_log(:, columns_to_keep);

% 결과 출력
disp('=== Variance Thresholding 결과 ===');
disp(['총 제거된 Feature 수: ', num2str(sum(~columns_to_keep))]);
disp('제거되지 않고 유지된 Feature 목록:');
disp(selected_features);
