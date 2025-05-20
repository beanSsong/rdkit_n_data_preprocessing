% 원본 데이터 백업
data_zscore = data

% === Z-Score 방식 ===
disp('=== Z-Score 방식으로 이상치 탐지 및 제거 ===');
removed_zscore_total = 0;

for i = 1:width(data)
    % 열 이름 추출
    feature_name = data.Properties.VariableNames{i};

    % Z-Score 계산
    z_scores = zscore(data_zscore.(feature_name));

    % Z-Score 기준으로 3 이상인 값 탐지
    outlier_index_zscore = abs(z_scores) > 3;
    removed_count = sum(outlier_index_zscore);

    % 이상치 제거
    data_zscore(outlier_index_zscore, :) = [];
    removed_zscore_total = removed_zscore_total + removed_count;

    % 결과 출력
    if removed_count > 0
        disp(['[Z-Score] ', feature_name, ': ', num2str(removed_count), '개의 이상치가 제거되었습니다.']);
    end
end

% 총 제거된 이상치 개수 출력
disp(['총 Z-Score 방식으로 제거된 이상치 개수: ', num2str(removed_zscore_total)]);
disp(['Z-Score 방식으로 이상치 제거 후 데이터 수: ', num2str(height(data_zscore))]);
disp('=========================================');
