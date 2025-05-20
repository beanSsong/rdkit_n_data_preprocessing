% === Correlation-based Feature Selection (with paired info) ===

% 1. 테이블 → 배열 변환 및 Feature 이름 획득
X = table2array(data_varthresh);
feature_names = data_varthresh.Properties.VariableNames;

% 2. 상관계수 행렬 계산
corr_matrix = corr(X);
upper_tri = triu(abs(corr_matrix), 1);  % 자기 자신 제외

% 3. 임계값 이상인 상관쌍 추출 (예: |r| > 0.9)
[r_idx, c_idx] = find(upper_tri > 0.9);

% 4. 제거 대상 Feature와 관련 Feature 이름 기록
features_to_remove = {};
removal_details = {};

for k = 1:length(r_idx)
    keep_feature = feature_names{r_idx(k)};
    remove_feature = feature_names{c_idx(k)};
    corr_value = corr_matrix(r_idx(k), c_idx(k));

    % 중복 제거 방지: 아직 리스트에 없을 때만 추가
    if ~ismember(remove_feature, features_to_remove)
        features_to_remove{end+1} = remove_feature;
        removal_details{end+1} = sprintf('%s (removed) ↔ %s (kept), r = %.2f', ...
            remove_feature, keep_feature, corr_value);
    end
end

% 5. 제거 대상 인덱스 추출 및 테이블에서 제거
cols_to_remove = ismember(feature_names, features_to_remove);
data_corrfiltered = data_varthresh(:, ~cols_to_remove);

% 6. 결과 출력
disp('=== Correlation-based Feature Selection 결과 ===');
disp(['제거된 Feature 수: ', num2str(length(features_to_remove))]);
disp('제거된 Feature ↔ 남긴 Feature 및 상관계수:');
disp(removal_details');
disp(['최종 남은 Feature 수: ', num2str(width(data_corrfiltered))]);
