%  원본 데이터 백업
data_iqr = data_uniq;

% === IQR 방식 ===
disp('=== IQR 방식으로 이상치 탐지 및 제거 ===');
removed_iqr_total = 0;

for i = 1:width(data)
    % 열 이름 추출
    feature_name = data.Properties.VariableNames{i};

    % 1사분위수(Q1)와 3사분위수(Q3) 계산
    Q1 = prctile(data_iqr.(feature_name), 25);
    Q3 = prctile(data_iqr.(feature_name), 75);
    IQR = Q3 - Q1;

    % IQR을 기준으로 상한선과 하한선 설정
    lowerBound = Q1 - 1.5 * IQR;
    upperBound = Q3 + 1.5 * IQR;

    % 이상치 탐지
    outlier_index_iqr = (data_iqr.(feature_name) < lowerBound) | (data_iqr.(feature_name) > upperBound);
    removed_count = sum(outlier_index_iqr);

    % 이상치 제거
    data_iqr(outlier_index_iqr, :) = [];
    removed_iqr_total = removed_iqr_total + removed_count;

    % 결과 출력
    if removed_count > 0
        disp(['[IQR] ', feature_name, ': ', num2str(removed_count), '개의 이상치가 제거되었습니다.']);
    end
end

% 총 제거된 이상치 개수 출력
disp(['총 IQR 방식으로 제거된 이상치 개수: ', num2str(removed_iqr_total)]);
disp(['IQR 방식으로 이상치 제거 후 데이터 수: ', num2str(height(data_iqr))]);
